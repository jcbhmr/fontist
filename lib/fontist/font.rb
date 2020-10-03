module Fontist
  class Font
    def initialize(options = {})
      @name = options.fetch(:name, nil)
      @confirmation = options.fetch(:confirmation, "no")

      check_or_create_fontist_path!
    end

    def self.all
      new.all
    end

    def self.find(name)
      new(name: name).find
    end

    def self.install(name, confirmation: "no")
      new(name: name, confirmation: confirmation).install
    end

    def self.uninstall(name)
      new(name: name).uninstall
    end

    def find
      find_system_font || downloadable_font || raise(
        Fontist::Errors::NonSupportedFontError
      )
    end

    def install
      find_system_font || download_font || raise(
        Fontist::Errors::NonSupportedFontError
      )
    end

    def uninstall
      uninstall_font || downloadable_font || raise(
        Fontist::Errors::NonSupportedFontError
      )
    end

    def all
      Fontist::Formula.all.to_h.map { |_name, formula| formula.fonts }.flatten
    end

    private

    attr_reader :name, :confirmation

    def find_system_font
      Fontist::SystemFont.find(name)
    end

    def check_or_create_fontist_path!
      unless Fontist.fonts_path.exist?
        require "fileutils"
        FileUtils.mkdir_p(Fontist.fonts_path)
      end
    end

    def font_installer(formula)
      Object.const_get(formula.installer)
    end

    def formula
      @formula ||= Fontist::Formula.find(name)
    end

    def downloadable_font
      if formula
        raise(
          Fontist::Errors::MissingFontError,
          "#{name} fonts are missing, please run " \
          "Fontist::Font.install('#{name}', confirmation: 'yes') to " \
          "download the font."
        )
      end
    end

    def download_font
      if formula
        check_and_confirm_required_license(formula)
        font_installer(formula).fetch_font(name, confirmation: confirmation)
      end
    end

    def check_and_confirm_required_license(formula)
      if formula.license_required && !confirmation.casecmp("yes").zero?
        @confirmation = show_license_and_ask_for_input(formula.license)

        if !confirmation.casecmp("yes").zero?
          raise Fontist::Errors::LicensingError.new(
            "Fontist will not download these fonts unless you accept the terms."
          )
        end
      end
    end

    def show_license_and_ask_for_input(license)
      Fontist.ui.say(license_agrement_message(license))
      Fontist.ui.ask(
        "\nDo you accept all presented font licenses, and want Fontist " \
        "to download these fonts for you? => TYPE 'Yes' or 'No':"
      )
    end

    def license_agrement_message(license)
      <<~MSG
        FONT LICENSE ACCEPTANCE REQUIRED FOR "#{name}":

        Fontist can install this font if you accept its licensing conditions.

        FONT LICENSE BEGIN ("#{name}")
        -----------------------------------------------------------------------
        #{license}
        -----------------------------------------------------------------------
        FONT LICENSE END ("#{name}")
      MSG
    end

    def uninstall_font
      paths = find_fontist_font
      return unless paths

      paths.each do |path|
        File.delete(path)
      end

      paths
    end

    def find_fontist_font
      Fontist::FontistFont.find(name)
    end
  end
end

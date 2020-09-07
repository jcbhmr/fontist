require "fontist/import/helpers/system_helper"
require_relative "../otf/font_file"

module Fontist
  module Import
    module Files
      class CollectionFile
        STRIP_TTC_BINARY = Fontist.root_path.join("bin", "stripttc")

        attr_reader :fonts

        def initialize(path)
          @path = path
          @fonts = read
        end

        def filename
          File.basename(@path)
        end

        private

        def read
          switch_to_temp_dir do |tmp_dir|
            extract_ttfs(tmp_dir).map do |path|
              Otf::FontFile.new(path)
            end
          end
        end

        def switch_to_temp_dir
          Dir.mktmpdir do |tmp_dir|
            Dir.chdir(tmp_dir) do
              yield tmp_dir
            end
          end
        end

        def extract_ttfs(tmp_dir)
          Helpers::SystemHelper.run("#{STRIP_TTC_BINARY} #{@path}")

          basename = File.basename(@path, ".ttc")
          Dir.glob(File.join(tmp_dir, "#{basename}_[0-9][0-9].ttf"))
        end
      end
    end
  end
end

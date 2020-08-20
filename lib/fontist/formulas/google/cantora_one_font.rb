module Fontist
  module Formulas
    class CantoraOneFont < FontFormula
      FULLNAME = "Cantora One".freeze
      CLEANNAME = "CantoraOne".freeze

      desc FULLNAME
      homepage "www.impallari.com"

      resource "#{CLEANNAME}.zip" do
        url "https://fonts.google.com/download?family=Cantora%20One"
        sha256 "e117ac04349b3b31d08dcc6cf9a31c61ceb508423bdf0f2193aa41e307af9ae9"
      end

      provides_font(
        FULLNAME,
        match_styles_from_file: [
          {
            family_name: "CantoraOne",
            style: "Regular",
            full_name: "CantoraOne",
            post_script_name: "CantoraOne-Regular",
            version: "1.001; ttfautohint (v0.8) -G 200 -r 50",
            description: "Cantora ('Singer' in Spanish) is a friendly semi formal, semi condensed, semi sans serif.
It has reminiscences of hand lettering, mixing straight and bowed stems, and natural curves.

It was born as an experiment in drawing from the outside to the inside (drawing the space surrounding the letters first, instead of drawing the letters themselves) in trying to apply the ideas and methods of Michael Harvey and Evert Bloemsma to my own glyphs construction.

Although Cantora it's a sans, the lowercase letters have serif proportions.
It's perfect for headlines (H1, H2, H3) in sizes larger than 20px.",
            filename: "CantoraOne-Regular.ttf",
            copyright: "Copyright (c) 2012, Pablo Impallari (www.impallari.com|impallari@gmail.com), Rodrigo Fuenzalida (www.rfuenzalida.com|hello@rfuenzalida.com) with Reserved Font Name Cantora.",
          },
        ]
      )

      def extract
        resource("#{CLEANNAME}.zip") do |resource|
          zip_extract(resource) do |fontdir|
            match_fonts(fontdir, FULLNAME)
          end
        end
      end

      def install
        case platform
        when :macos
          install_matched_fonts "$HOME/Library/Fonts/#{CLEANNAME}"
        when :linux
          install_matched_fonts "/usr/share/fonts/truetype/#{CLEANNAME.downcase}"
        end
      end

      test do
        case platform
        when :macos
          assert_predicate "$HOME/Library/Fonts/#{CLEANNAME}/CantoraOne-Regular.ttf", :exist?
        when :linux
          assert_predicate "/usr/share/fonts/truetype/#{CLEANNAME.downcase}/CantoraOne-Regular.ttf", :exist?
        end
      end

      copyright "Copyright (c) 2012, Pablo Impallari (www.impallari.com|impallari@gmail.com), Rodrigo Fuenzalida (www.rfuenzalida.com|hello@rfuenzalida.com) with Reserved Font Name Cantora."
      license_url "http://scripts.sil.org/OFL"

      open_license <<~TEXT
        Copyright (c) 2011, Pablo Impallari (www.impallari.com|impallari@gmail.com),
        Rodrigo Fuenzalida (www.rfuenzalida.com) with Reserved Font Name Cantora.

        This Font Software is licensed under the SIL Open Font License, Version 1.1.
        This license is copied below, and is also available with a FAQ at:
        http://scripts.sil.org/OFL


        -----------------------------------------------------------
        SIL OPEN FONT LICENSE Version 1.1 - 26 February 2007
        -----------------------------------------------------------

        PREAMBLE
        The goals of the Open Font License (OFL) are to stimulate worldwide
        development of collaborative font projects, to support the font creation
        efforts of academic and linguistic communities, and to provide a free and
        open framework in which fonts may be shared and improved in partnership
        with others.

        The OFL allows the licensed fonts to be used, studied, modified and
        redistributed freely as long as they are not sold by themselves. The
        fonts, including any derivative works, can be bundled, embedded,
        redistributed and/or sold with any software provided that any reserved
        names are not used by derivative works. The fonts and derivatives,
        however, cannot be released under any other type of license. The
        requirement for fonts to remain under this license does not apply
        to any document created using the fonts or their derivatives.

        DEFINITIONS
        "Font Software" refers to the set of files released by the Copyright
        Holder(s) under this license and clearly marked as such. This may
        include source files, build scripts and documentation.

        "Reserved Font Name" refers to any names specified as such after the
        copyright statement(s).

        "Original Version" refers to the collection of Font Software components as
        distributed by the Copyright Holder(s).

        "Modified Version" refers to any derivative made by adding to, deleting,
        or substituting -- in part or in whole -- any of the components of the
        Original Version, by changing formats or by porting the Font Software to a
        new environment.

        "Author" refers to any designer, engineer, programmer, technical
        writer or other person who contributed to the Font Software.

        PERMISSION & CONDITIONS
        Permission is hereby granted, free of charge, to any person obtaining
        a copy of the Font Software, to use, study, copy, merge, embed, modify,
        redistribute, and sell modified and unmodified copies of the Font
        Software, subject to the following conditions:

        1) Neither the Font Software nor any of its individual components,
        in Original or Modified Versions, may be sold by itself.

        2) Original or Modified Versions of the Font Software may be bundled,
        redistributed and/or sold with any software, provided that each copy
        contains the above copyright notice and this license. These can be
        included either as stand-alone text files, human-readable headers or
        in the appropriate machine-readable metadata fields within text or
        binary files as long as those fields can be easily viewed by the user.

        3) No Modified Version of the Font Software may use the Reserved Font
        Name(s) unless explicit written permission is granted by the corresponding
        Copyright Holder. This restriction only applies to the primary font name as
        presented to the users.

        4) The name(s) of the Copyright Holder(s) or the Author(s) of the Font
        Software shall not be used to promote, endorse or advertise any
        Modified Version, except to acknowledge the contribution(s) of the
        Copyright Holder(s) and the Author(s) or with their explicit written
        permission.

        5) The Font Software, modified or unmodified, in part or in whole,
        must be distributed entirely under this license, and must not be
        distributed under any other license. The requirement for fonts to
        remain under this license does not apply to any document created
        using the Font Software.

        TERMINATION
        This license becomes null and void if any of the above conditions are
        not met.

        DISCLAIMER
        THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
        EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
        MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
        OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL THE
        COPYRIGHT HOLDER BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
        INCLUDING ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL
        DAMAGES, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
        FROM, OUT OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM
        OTHER DEALINGS IN THE FONT SOFTWARE.
      TEXT
    end
  end
end

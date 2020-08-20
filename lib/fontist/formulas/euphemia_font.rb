module Fontist
  module Formulas
    class EuphemiaFont < FontFormula
      desc "Euphemia Font"
      homepage "https://www.tiro.com/syllabics/resources/index.html"

      resource "euphemia.zip" do
        url "https://www.tiro.com/syllabics/resources/compiled_data_sources/Fonts/Euphemia/%202.6.6%20Euphemia%20UCAS.zip"
        sha256 "3a8a7181faf1a50e4cab35ad128ff11df7980c45e9c57e1f190f4355433b59f7"
      end

      provides_font(
        "Euphemia UCAS",
        match_styles_from_file: [
          {
            family_name: "Euphemia UCAS",
            style: "Italic",
            full_name: "Euphemia UCAS Italic",
            post_script_name: "EuphemiaUCAS-Italic",
            version: "2.660 2004",
            description: "Copyright (c) 2004 by Tiro Typeworks. All rights reserved.",
            filename: "Euphemia UCAS Italic 2.6.6.ttf",
            copyright: "Copyright (c) 2004 by Tiro Typeworks. All rights reserved.",
          },
          {
            family_name: "Euphemia UCAS",
            style: "Regular",
            full_name: "Euphemia UCAS",
            post_script_name: "EuphemiaUCAS",
            version: "2.660 2004",
            description: "Copyright (c) 2004 by Tiro Typeworks. All rights reserved.",
            filename: "Euphemia UCAS Regular 2.6.6.ttf",
            copyright: "Copyright (c) 2004 by Tiro Typeworks. All rights reserved.",
          },
          {
            family_name: "Euphemia UCAS",
            style: "Bold",
            full_name: "Euphemia UCAS Bold",
            post_script_name: "EuphemiaUCAS-Bold",
            version: "2.660 2005",
            description: "Copyright (c) 2004 by Tiro Typeworks. All rights reserved.",
            filename: "Euphemia UCAS Bold 2.6.6.ttf",
            copyright: "Copyright (c) 2004 by Tiro Typeworks. All rights reserved.",
          },
        ]
      )

      def extract
        resource("euphemia.zip") do |resource|
          zip_extract(resource) do |fontdir|
            match_fonts(fontdir, "Euphemia UCAS")
          end
        end
      end

      def install
        case platform
        when :macos
          install_matched_fonts "$HOME/Library/Fonts/Euphemia"
        when :linux
          install_matched_fonts "/usr/share/fonts/truetype/euphemia"
        end
      end

      test do
        case platform
        when :macos
          assert_predicate "$HOME/Library/Fonts/Euphemia/Euphemia UCAS Italic 2.6.6.ttf", :exist?
        when :linux
          assert_predicate "/usr/share/fonts/truetype/euphemia/Euphemia UCAS Italic 2.6.6.ttf", :exist?
        end
      end

      license_url "https://www.tiro.com/syllabics/resources/euphemia_EULA.html"

      open_license <<~EOS
  FONT SOFTWARE PRODUCT LICENSE
  The FONT SOFTWARE is protected by copyright laws and international copyright treaties, as well as other intellectual property laws and treaties. The FONT SOFTWARE is licensed, not sold.

  Subject to the foregoing, Tiro Typeworks grants you a perpetual non-exclusive license to use the Font Software with the following terms and conditions:

  1. ACCEPTANCE OF TERMS
  Installation and use of this software constitutes acceptance of the terms of this licence agreement.

  2. GRANT OF LICENSE. This document grants you the following rights:
  - Installation and Use. You may install and use the Font Software on up to 100 computers or users, provided that you agree to inform your employees or any other person having access to the Font Software and copies thereof, of the terms and conditions of this Font Software License Agreement and to ensure that they shall strictly abide by these terms and conditions. A Distribution Agreement must be purchased to in any form re-distribute the Font Software. Tiro Typeworks and its Licensed Distributors has the right to terminate your license immediately if you fail to comply with any term of this Agreement. Upon termination, you must destroy the original and any and all copies of the Font Software.

  2.1 You acknowledge that the Font Software is the intellectual property of Tiro Typeworks and/or its several licensors. The term Font Software shall also include any updates, upgrades, additions, modified versions, and work copies of the Font Software licensed to you by Tiro Typeworks. The media itself is and shall remain the property of Tiro Typeworks. Expanded versions, subsets or other derivatives of this design may also exist under other names and be distributed by Tiro Typeworks or other licensed Distributors.

  2.2 Modification. You are not allowed to without written approval granted by Tiro Typeworks:
  - modify, reverse compile or merge or ship the Font Software with other software programs,
  - adapt modules, produce sub-sets or supersets or alter any internal font data thereof for your own developments, or
  - put the software solutions embodied in the Font Software to any commercial use other than operating your own computer or output device.
  - modify and/or recompile the Font Software: this includes generating or re-compiling the Font Software from any font design program. (where a 'font design' program is any piece of software capable of reading and re-compiling any standard font format)

  PLEASE CONTACT TIRO TYPEWORKS OR A LICENSED DISTRIBUTOR IF THERE ARE SPECIFIC MODIFICATIONS THAT YOU REQUIRE.

  2.3 You are only allowed to transfer or assign the Font-Software to a third party if such transfer complies with all of the following conditions:
  - The recipient confirms their consent to all terms and conditions of this Font-Software License Agreement.

  2.4 Only for the purpose of outputting particular files may you take a copy of the font(s) you have used for such files to a commercial printer or other service bureau, and only if such service bureau has informed you that it has purchased or has been granted a license to use the respective Font-Software. As this font is distributed under a free license, any service bureau or commercial printer may also obtain a license with no cost associated with acquiring a license to the font(s). Only those parties specifically granted 'Distribution Rights' may distribute and grant licenses to the Font Software. Such Distribution Rights may be obtained by contacting Tiro Typeworks.

  2.5 Portable Documents. You may "embed" the Font Software within PostScript-Language files, .PDF files, and .EVY files for distribution, viewing, and imaging to other parties.

  3. Disclaimer and Limited Warranty.
  AS ALLOWED BY LAW, THE SOFTWARE AND ACCOMPANYING WRITTEN MATERIALS ARE PROVIDED 'AS IS' WITHOUT WARRANTY OF ANY KIND, EXPRESSED OR IMPLIED, AND TIRO TYPEWORKS AND ASSOCIATIONS OR COMPANIES DISTRIBUTING THE FONT SOFTWARE DISCLAIMS THE WARRANTIES OF FITNESS FOR A PARTICULAR PURPOSE AND MERCHANTABILITY. IN ADDITION, TIRO TYPEWORKS AND ASSOCIATIONS OR COMPANIES DISTRIBUTING THE FONT SOFTWARE DOES NOT MAKE ANY REPRESENTATIONS REGARDING THE USE OR THE RESULTS OF THE USE OF THE SOFTWARE OR THE WRITTEN MATERIALS IN TERMS OF CORRECTNESS, ACCURACY, RELIABILITY, CURRENTNESS OR OTHERWISE. THE ENTIRE RISK AS A RESULT OF THE PERFORMANCE OF THE SOFTWARE IS ASSUMED BY THE USER.

  4. Without limiting the generality of the foregoing, you agree that you will not distribute or disseminate all or any part of the Font Software through any on-line service and you further agree that any such intentional distribution shall constitute a theft by you of a valuable property of Tiro Typeworks and/or its suppliers.

  5. Governing Law
  This agreement is governed by the laws of the Canada. In the event that any provision of this agreement is held to be illegal or otherwise unenforceable, such provision shall be deemed to have been deleted from this agreement, while the remaining provisions of this agreement shall be unaffected and shall continue in full force and effect.
      EOS
    end
  end
end

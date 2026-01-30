module Menu
    def self.show_and_get_chars()
            menu = <<~MENU
        ╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
        ║                                                                                                                                      ║
        ║  1 - Blocks               6 - It's up to you <3       11 - Quadrant Blocks       16 - Alphanumeric          21 - Digital/7-Segment   ║
        ║  2 - Unicode (Braille)    7 - ASCII Only              12 - Sextants (6-part)     17 - Extra Symbols         22 - Math Symbols        ║
        ║  3 - Spaced Unicode       8 - Border Characters       13 - Technical Symbols     18 - Solid Blocks          23 - Minimalist Dots     ║
        ║  4 - Half Blocks          9 - Geometric Shapes        14 - Wedge Shapes          19 - Vertical Halves       24 - Mixed Density       ║
        ║  5 - Japanese             10 - Dot Patterns           15 - Latin Letters         20 - Wide Characters       25 - Artistic Flow       ║
        ║  26 - Binary/Barcode      27 - Vertical Bar Gradient  28 - Asian-inspired        29 - Circle Progression                             ║
        ║  30 - Unique Unicode      31 - Mixed Block Types                                                                                     ║
        ║                                                                                                                                      ║
        ╚══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
        MENU

        puts menu

        options = read_int(min_value: 1, max_value: 32)

        chars = case options
        when 1
        '--chars=" ░▒▓█"'              # Original blocks
        when 2
        '--chars=" ⣀⣤⣶⣯⣟⣷⣿"'    # Braille gradient
        when 3
        '--chars=" ⠁⠃⠇⠏⠟⠿⡿⣿"'    # Spaced braille
        when 4
        '--chars=" ▘▝▖▗▌▐▀▄█"'          # Half blocks
        when 5
        '--chars=" ･｡ｧｨｩｪｫｰｱﾏﾓﾜ"'     # Japanese
        when 6
        clear_all()
        typewrite(Colors::RED + "Characters (min 2):\n")
        print "> "
        input_chars = gets.chomp
        "--chars=#{input_chars}"
        when 7
        '--chars=" .:;+*?%$@#"'        # ASCII art basic
        when 8
        '--chars=" ─│┌┐└┘├┤┬┴┼"'        # Box drawing
        when 9
        '--chars=" ▲▼◀▶◆■○●□△▽◇◊"'   # Geometric
        when 10
        '--chars=" ·•∙⦁●◌○◎◉●◯"'      # Dot progression
        when 11
        '--chars=" ▖▗▘▝▚▞▙▟"'          # Quadrants
        when 12
        '--chars=" 🬀🬁🬂🬃🬄🬅🬆🬇🬈🬉"'    # Sextants
        when 13
        '--chars=" ⌘⌥⎇⏎␣⏏⚙️🔧🛠️"'   # Technical symbols
        when 14
        '--chars=" ◢◣◤◥◸◹◺◿"'          # Wedge shapes
        when 15
        '--chars=" ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"' # Latin letters
        when 16
        '--chars=" ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"' # Alphanumeric
        when 17
        '--chars=" ★☆♪♫♥♦♣♠☀☁☂☃"'    # Extra symbols
        when 18
        '--chars=" █▉▊▋▌▍▎▏"'          # Solid block progression
        when 19
        '--chars=" ▀▄█"'                # Vertical halves
        when 20
        '--chars=" ＡＢＣＤＥＦＧＨＩＪＫＬＭＮＯＰＱＲＳＴＵＶＷＸＹＺ"' # Full-width
        when 21
        '--chars=" ⓪①②③④⑤⑥⑦⑧⑨"'    # Digital/circled numbers
        when 22
        '--chars=" +−×÷=≠≈±√∞∫∑∏∂"'   # Math symbols
        when 23
        '--chars="  ·∙∙⸱⸳⸰ꓸ"'        # Minimalist small dots
        when 24
        '--chars="  .:^~+*xX%&$@#█"'   # Mixed density gradient
        when 25
        '--chars="  ۞۩≋≌∿≈～〰️♪♫♬"'  # Artistic/flow symbols
        when 26
        '--chars="  01█"'              # Binary/barcode style
        when 27
        '--chars=" ▏▎▍▌▋▊▉█▇▆▅▄▃▂▁"'  # Vertical bar gradient
        when 28
        '--chars=" ╱╲╳┃━┏┓┗┛┣┫┳┻╋"'    # Asian-inspired
        when 29
        '--chars=" ◐◑◒◓◔◕◖◗◦◌◍◎●◯"'   # Circle progression
        when 30
        '--chars=" ᗧᗢᗣᗤᗨᗩᗪᗫ"'       # Unique Unicode shapes
        when 31
        '--chars=" ░▒▓▚▞▀▄█"'          # Mixed block types
        else
        ''
        end

        chars
     end
end

def steam_safe_text(text)
  text.gsub(' ', "\u00A0")
end

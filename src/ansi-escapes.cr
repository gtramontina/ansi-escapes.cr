require "./ansi-escapes/*"

# [ANSI escape codes](http://www.termsys.demon.co.uk/vtansi.htm) for manipulating the terminal.

# A copycat of [ansi-escapes](https://github.com/sindresorhus/ansi-escapes]) for javascript by [@sindresorhus](https://github.com/sindresorhus). Thank you!
module AnsiEscapes
  # The escape string.
  ESC = "\u001b["
  # Output a beeping sound.
  BEEP = "\u0007"

  module Cursor
    # Move cursor to the left side.
    LEFT = "#{ESC}100D"
    # Save cursor position.
    SAVE_POSITION = "#{ESC}s"
    # Restore saved cursor position.
    RESTORE_POSITION = "#{ESC}u"
    # Get cursor position.
    GET_POSITION = "#{ESC}6n"
    # Move cursor to the next line.
    NEXT_LINE = "#{ESC}E"
    # Move cursor to the previous line.
    PREVIOUS_LINE = "#{ESC}F"
    # Hide cursor.
    HIDE = "#{ESC}?25l"
    # Show cursor.
    SHOW = "#{ESC}?25h"

    # Move the cursor to the home position at the upper-left corner of the screen (`x0` `y0`).
    def self.home
      "#{ESC}H"
    end

    # Absolutely set cursor column.
    def self.to(x : Int32)
      "#{ESC}#{x + 1}G"
    end

    # Absolutely set cursor column and row.
    def self.to(x : Int32, y : Int32)
      "#{ESC}#{y + 1};#{x + 1}H"
    end

    # Move cursor up a specific amount of rows.
    def self.up(count = 1)
      "#{ESC}#{count}A"
    end

    # Move cursor down a specific amount of rows.
    def self.down(count = 1)
      "#{ESC}#{count}B"
    end

    # Move cursor forward a specific amount of columns.
    def self.forward(count = 1)
      "#{ESC}#{count}C"
    end

    # Move cursor backward a specific amount of columns.
    def self.backward(count = 1)
      "#{ESC}#{count}D"
    end

    # Set the position of the cursor relative to its current position.
    def self.move(x : Int32, y : Int32)
      ret = ""
      if (x < 0)
        ret += "#{ESC}#{-x}D"
      elsif (x > 0)
        ret += "#{ESC}#{x}C"
      end

      if (y < 0)
        ret += "#{ESC}#{-y}A"
      elsif (y > 0)
        ret += "#{ESC}#{y}B"
      end
      ret
    end
  end

  module Erase
    # Erase from the current cursor position to the end of the current line.
    END_LINE = "#{ESC}K"
    # Erase from the current cursor position to the start of the current line.
    START_LINE = "#{ESC}1K"
    # Erase the entire current line.
    LINE = "#{ESC}2K"
    # Erase the screen from the current line down to the bottom of the screen.
    DOWN = "#{ESC}J"
    # Erase the screen from the current line up to the top of the screen.
    UP = "#{ESC}1J"
    # Erase the screen and move the cursor home.
    SCREEN = "#{ESC}2J"

    # Erase from the current cursor position up the specified amount of rows.
    def self.lines(count : Int32)
      clear = ""
      (0...count).each do |i|
        clear += "#{Cursor::LEFT}#{Erase::END_LINE}#{i < (count - 1) ? Cursor.up : ""}"
      end
      clear
    end
  end

  struct Scroll
    # Scroll display up one line.
    UP = "#{ESC}S"
    # Scroll display down one line.
    DOWN = "#{ESC}T"
  end
end

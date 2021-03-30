# ansi-escapes.cr ![CI](https://github.com/gtramontina/ansi-escapes.cr/actions/workflows/ci.yml/badge.svg)

[ANSI escape codes](http://www.termsys.demon.co.uk/vtansi.htm) for manipulating the terminal.

A copycat of [ansi-escapes](https://github.com/sindresorhus/ansi-escapes) for javascript by [@sindresorhus](https://github.com/sindresorhus). Thank you!

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  ansi-escapes:
    github: gtramontina/ansi-escapes.cr
```

## Usage

```crystal
require "ansi-escapes"

# move the cursor two rows up and to the left
puts "#{AnsiEscapes::Cursor.up(2)}#{AnsiEscapes::Cursor::LEFT}HI!" # => "\u001b[2A\u001b[1000DHI!"
```

You might want to `include AnsiEscapes` so your code reads a _little_ better:

```crystal
require "ansi-escapes"
include AnsiEscapes

# move the cursor two rows up and to the left
puts "#{Cursor.up(2)}#{Cursor::LEFT}HI!" # => "\u001b[2A\u001b[1000DHI!"
```

### API

* `AnsiEscapes::ESC`: The escape string.
* `AnsiEscapes::BEEP`: Output a beeping sound.
* `AnsiEscapes::Cursor::LEFT`: Move cursor to the left side.
* `AnsiEscapes::Cursor::SAVE_POSITION`: Save cursor position.
* `AnsiEscapes::Cursor::RESTORE_POSITION`: Restore saved cursor position.
* `AnsiEscapes::Cursor::GET_POSITION`: Get cursor position.
* `AnsiEscapes::Cursor::NEXT_LINE`: Move cursor to the next line.
* `AnsiEscapes::Cursor::PREVIOUS_LINE`: Move cursor to the previous line.
* `AnsiEscapes::Cursor::HIDE`: Hide cursor.
* `AnsiEscapes::Cursor::SHOW`: Show cursor.
* `AnsiEscapes::Cursor.home`: Move the cursor to the home position at the upper-left corner of the screen (`x0` `y0`).
* `AnsiEscapes::Cursor.to(x : Int32)`: Absolutely set cursor column.
* `AnsiEscapes::Cursor.to(x : Int32, y : Int32)`: Absolutely set cursor column and row.
* `AnsiEscapes::Cursor.up(count = 1)`: Move cursor up a specific amount of rows.
* `AnsiEscapes::Cursor.down(count = 1)`: Move cursor down a specific amount of rows.
* `AnsiEscapes::Cursor.forward(count = 1)`: Move cursor forward a specific amount of columns.
* `AnsiEscapes::Cursor.backward(count = 1)`: Move cursor backward a specific amount of columns.
* `AnsiEscapes::Cursor.move(x : Int32, y : Int32)`: Set the position of the cursor relative to its current position.
* `AnsiEscapes::Erase::END_LINE`: Erase from the current cursor position to the end of the current line.
* `AnsiEscapes::Erase::START_LINE`: Erase from the current cursor position to the start of the current line.
* `AnsiEscapes::Erase::LINE`: Erase the entire current line.
* `AnsiEscapes::Erase::DOWN`: Erase the screen from the current line down to the bottom of the screen.
* `AnsiEscapes::Erase::UP`: Erase the screen from the current line up to the top of the screen.
* `AnsiEscapes::Erase.lines(count : Int32)`: Erase from the current cursor position up the specified amount of rows.
* `AnsiEscapes::Erase::SCREEN`: Erase the screen and move the cursor home.
* `AnsiEscapes::Screen::UP`: Scroll display up one line.
* `AnsiEscapes::Screen::DOWN`: Scroll display down one line.

## Contributing

1. Fork it ( https://github.com/gtramontina/ansi-escapes.cr/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

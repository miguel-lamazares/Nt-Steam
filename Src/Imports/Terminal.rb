require 'io/console'

#
# CLEAR TERMINAL
#
def clear_all
  print "\e[H\e[2J"
  $stdout.flush
end

#
# WAIT ENTER AND CLEAR
#
def wait_enter_clear(prompt = "\n\nPress Enter...")
  print prompt
  STDIN.gets
  print "\e[F\e[K"
end

#
# COLORS
#
module Colors
  RESET  = "\e[0m"
  BLACK  = "\e[30m"
  RED    = "\e[31m"
  GREEN  = "\e[32m"
  YELLOW = "\e[33m"
  BLUE   = "\e[34m"
  PURPLE = "\e[35m"
  CYAN   = "\e[36m"
  WHITE  = "\e[37m"
end

#
# READ RESPONSE FROM USER
#
def read_int(min_value:, max_value:)
  loop do
    user_input = STDIN.gets.chomp

    unless user_input.match?(/\A\d+\z/)
      print "\e[F\e[K"
      next
    end

    choice = user_input.to_i

    if choice < min_value || choice > max_value
      print "\e[F\e[K"
      next
    end

    return choice
  end
end

#
# TYPEWRITE
#
def typewrite(text, speed = 0.03)
  text.each_char do |char|
    print char
    $stdout.flush
    sleep speed
  end
  puts
end

#
# PROGRESS BAR
#
def print_progress_bar(current, total, bar_length = 20)
  progress = current.to_f / total
  filled_length = (bar_length * progress).to_i
  bar = '∎' * filled_length + '.' * (bar_length - filled_length)
  por = progress * 100

  print "\r[#{bar}] #{'%.2f' % por}% #{current}/#{total} :) "
  $stdout.flush

  puts if current == total
end

#
# PRINT CENTRALIZED TEXT
#

def terminal_width
  IO.console.winsize[1]
rescue
  80
end

def strip_ansi_codes(text)
  text.gsub(/\e\[[0-9;]*[A-Za-z]/, '')
end

def print_centralized_text(text)
  term_width = terminal_width

  text.each_line do |line|
    visible = strip_ansi_codes(line.chomp)
    padding = [(term_width - visible.length) / 2, 0].max
    puts (' ' * padding) + line.chomp
  end
end


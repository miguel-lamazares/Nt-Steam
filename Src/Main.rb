require 'mini_magick'
require 'fileutils'

require_relative 'Imports/Terminal'
require_relative 'Imports/logo'
require_relative 'Imports/options'

print_centralized_text("dex")

puts "Image Address: "
image_path = gets.chomp
clear_all()

puts "What size do you wanna convert to? from 40x10 to 100x40"
puts "Width: "    
width = gets.chomp.to_i
if width < 40 || width > 100
  puts "Width must be between 40 and 100"
  exit
end
clear_all()
puts "Height: "
height = gets.chomp.to_i
if height < 10 || height > 40
  puts "Height must be between 10 and 40"
  exit
end
clear_all()
image = MiniMagick::Image.open(image_path)

image.colorspace "Gray"

FileUtils.mkdir_p("./IMG")

image.write "./IMG/resized_image.jpg"

new_image_path = "./IMG/resized_image.jpg"

clear_all()
puts "Do you wanna some style? (y/n)"
style_choice = gets.chomp.downcase
clear_all()
if style_choice == 'y'
  chars = Menu.show_and_get_chars()
  clear_all()
  chars_value = chars.sub(/^--chars=/, '')
  system("jp2a #{new_image_path} --background=dark --size=#{width}x#{height} #{chars_value}")
else
    clear_all()
  system("jp2a #{new_image_path} --background=dark --size=#{width}x#{height}")
end

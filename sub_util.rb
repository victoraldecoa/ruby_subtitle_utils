class SubtitleElement
	attr_accessor :number, :beginning, :ending, :lines

	def write(file)
		file.write "#{number}\n"
		file.write "#{beginning} --> #{ending}\n"
		lines.each do |line|
			file.write "#{line}\n"
		end
		file.write "\n"
	end
end

class SubtitleElementParser
	def initialize(encoding)
		@encoding = encoding
	end

	def fill_date(el, line)
		dates = line.strip.split(' --> ')
		el.beginning = dates.first
		el.ending = dates.last
	end

	def parse(file)
		el = SubtitleElement.new
		el.number = file.readline.to_i
		dates = file.readline
		fill_date(el, dates)
		el.lines = Array.new

		loop do
			line = file.eof ? "" : file.readline.encode("UTF-8", @encoding).strip
			break if line.empty?
			el.lines << line
		end
		el
	end
end

def manipulate_file(file_name)
	new_file = File.open("temp.srt", "w")
	current_line = @initial_line

	parser = SubtitleElementParser.new(@encoding)

	File.open(file_name, "r") do |file|
		until file.eof?
			el = parser.parse(file)
			el.number = current_line
			current_line += 1
			el.write(new_file)
		end
	end
end

def print_usage
	puts "Usage: ruby sub_util.rb FILENAME"
end

@encoding = "Windows-1252"
@initial_line = 100
file_name = ARGV.join(' ')
if ARGV.empty? || ARGV.include?('-h')
	print_usage
elsif !File.exist?(file_name)
	puts "File \"#{file_name}\" not found"
	print_usage
else
	manipulate_file(file_name)
end

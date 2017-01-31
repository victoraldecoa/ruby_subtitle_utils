# ruby_subtitle_utils

Simple script that changes a subtitle file (srt) sequence order, which can be used to merge two separate subtitles

# Usage:
- Change the desired initial line by changing the @initial_line value
- Change the desired encoding by changing the @encoding value
- Run ruby sub_util.rb FILENAME

# Future ideas:
- Use ARGV to get the initial line
- Use ARGV to get the encoding
- Auto-Detect encoding using https://github.com/jmhodges/rchardet
- Parse dates
- Implement Re-sync (adding or subtracting a constant time)
- Implement linear correction, as in http://subshifter.bitsnbites.eu/
- FileUtils.mv temp file to -o file (or to original)
- Use Shoes! GUI
- Distribute binary files using https://github.com/phusion/traveling-ruby

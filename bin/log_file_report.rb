$LOAD_PATH.unshift(File.expand_path('../lib'))

require 'log_file'

file_contents = File.read(File.expand_path("../data/log.log"))

log_file = LogFile.new(file_contents)

puts log_file.min_date
puts log_file.max_date

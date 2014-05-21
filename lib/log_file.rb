require 'log_line'

class LogFile
  def initialize(contents)
    @lines = contents.split("\n").map do |line|
      LogLine.new(line)
    end
  end

  def min_date
    sorted_lines.first.date
  end

  def max_date
    sorted_lines.last.date
  end

  def lines_for(date)
    sorted_lines.select { |line| line.date == date }.length
  end

  private

  def sorted_lines
    @lines.sort_by { |line| line.date }
  end

end
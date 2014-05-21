class LogLine
  def initialize(line_text)
    @line_text = line_text
  end

  def date
    Date.parse(@line_text[4..26])
  end
end
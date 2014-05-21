require 'log_file'

describe LogFile do
  it 'knows what the min and max date is on the contents' do
    contents = <<-LOG
D, [2014-05-10T14:48:19.093626 #85971] DEBUG -- : maximize proactive e-business
W, [2014-05-15T14:48:19.140614 #85971]  WARN -- : reintermediate value-added methodologies
D, [2014-05-16T14:48:19.157486 #85971] DEBUG -- : strategize magnetic content
    LOG

    file = LogFile.new(contents)

    expect(file.min_date).to eq Date.parse("2014-05-10T14:48:19.093626")
    expect(file.max_date).to eq Date.parse("2014-05-16T14:48:19.157486")
  end

  it 'knows how many log lines there are for a certain date' do
    contents = <<-LOG
D, [2014-05-15T14:48:19.093626 #85971] DEBUG -- : maximize proactive e-business
W, [2014-05-15T14:48:19.140614 #85971]  WARN -- : reintermediate value-added methodologies
D, [2014-05-16T14:48:19.157486 #85971] DEBUG -- : strategize magnetic content
    LOG

    file = LogFile.new(contents)

    expect(file.lines_for(Date.parse('2014-05-15'))).to eq 2
  end

  it 'can group number of lines for each severity' do
    contents = <<-LOG
D, [2014-05-15T14:48:19.093626 #85971] DEBUG -- : maximize proactive e-business
W, [2014-05-15T14:48:19.140614 #85971]  WARN -- : reintermediate value-added methodologies
D, [2014-05-16T14:48:19.157486 #85971] DEBUG -- : strategize magnetic content
    LOG

    file = LogFile.new(contents)

    expected = {
        "DEBUG" => 2,
        "WARN" => 1
    }

    expect(file.number_of_lines_per_severity).to eq expected
  end
end
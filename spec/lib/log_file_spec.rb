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
end
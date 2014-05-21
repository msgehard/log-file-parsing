require 'log_line'

describe LogLine do
  let(:line_text) {'D, [2014-05-10T14:48:19.093626 #85971] DEBUG -- : maximize proactive e-business'}

  let(:line) {LogLine.new(line_text)}

  it 'can tell you the date of the log line' do
    expect(line.date).to eq Date.parse('2014-05-10T14:48:19.093626')
  end

  it 'can tell you the severity of the log line' do
    expect(line.severity).to eq 'DEBUG'
  end
end
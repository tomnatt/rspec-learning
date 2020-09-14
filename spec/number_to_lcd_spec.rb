require './number_to_lcd'

# rubocop:disable Metrics/BlockLength
describe NumberToLcd do
  it 'rejects single character input containing non-number' do
    input = '?'
    expect { described_class.new.output(input) }.to raise_error(TypeError)
  end

  it 'rejects multi-character input containing non-number' do
    input = '43?12'
    expect { described_class.new.output(input) }.to raise_error(TypeError)
  end

  it 'correctly prints 1' do
    input = 1
    expect(described_class.new.output(input)).to eql("   \n  |\n  |")
  end

  it 'correctly prints 2' do
    input = 2
    expect(described_class.new.output(input)).to eql(" _ \n _|\n|_ ")
  end

  it 'correctly prints 3' do
    input = 3
    expect(described_class.new.output(input)).to eql(" _ \n _|\n _|")
  end

  it 'correctly prints 4' do
    input = 4
    expect(described_class.new.output(input)).to eql("   \n|_|\n  |")
  end

  it 'correctly prints 5' do
    input = 5
    expect(described_class.new.output(input)).to eql(" _ \n|_ \n _|")
  end

  it 'correctly prints 6' do
    input = 6
    expect(described_class.new.output(input)).to eql(" _ \n|_ \n|_|")
  end

  it 'correctly prints 7' do
    input = 7
    expect(described_class.new.output(input)).to eql(" _ \n  |\n  |")
  end

  it 'correctly prints 8' do
    input = 8
    expect(described_class.new.output(input)).to eql(" _ \n|_|\n|_|")
  end

  it 'correctly prints 9' do
    input = 9
    expect(described_class.new.output(input)).to eql(" _ \n|_|\n _|")
  end

  it 'correctly prints 0' do
    input = 0
    expect(described_class.new.output(input)).to eql(" _ \n| |\n|_|")
  end

  it 'correctly prints 12' do
    input = 12
    expect(described_class.new.output(input)).to eql("    _ \n  \| _\|\n  \|\|_ ")
  end

  it 'correctly prints 123' do
    input = 123
    expect(described_class.new.output(input)).to eql("    _  _ \n  | _| _|\n  ||_  _|")
  end

  it 'correctly prints 2648' do
    input = 2648
    expect(described_class.new.output(input)).to eql(" _  _     _ \n _||_ |_||_|\n|_ |_|  ||_|")
  end

  it 'correctly prints 02522 - input as string to retain leading zero' do
    input = '02522'
    expect(described_class.new.output(input)).to eql(" _  _  _  _  _ \n| | _||_  _| _|\n|_||_  _||_ |_ ")
  end

  it 'correctly prints 1234567890' do
    input = 1_234_567_890
    expect(described_class.new.output(input))
      .to eql("    _  _     _  _  _  _  _  _ \n  | _| _||_||_ |_   ||_||_|| |\n  ||_  _|  | _||_|  ||_| _||_|")
  end
end
# rubocop:enable Metrics/BlockLength

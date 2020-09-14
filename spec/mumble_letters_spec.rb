require './mumble_letters'

# rubocop:disable Metrics/BlockLength
describe MumbleLetters do
  it 'deals with empty input' do
    input = ''
    expect(described_class.new.mumble(input)).to eql('')
  end

  it 'takes a single letter input' do
    input = 'a'
    expect(described_class.new.mumble(input)).to eql('A')
  end

  it 'takes a different single letter input' do
    input = 'X'
    expect(described_class.new.mumble(input)).to eql('X')
  end

  it 'rejects input of a single non-letter' do
    input = '?'
    expect { described_class.new.mumble(input) }.to raise_error(TypeError)
  end

  it 'rejects multi-character input containing a non-letter' do
    input = 'asd?asd'
    expect { described_class.new.mumble(input) }.to raise_error(TypeError)
  end

  it 'rejects multi-character input containing multiple non-letters' do
    input = 'dea#afra!aef'
    expect { described_class.new.mumble(input) }.to raise_error(TypeError)
  end

  it 'takes a two letter input' do
    input = 'ab'
    expect(described_class.new.mumble(input)).to eql('A-Bb')
  end

  it 'takes a three letter input' do
    input = 'abC'
    expect(described_class.new.mumble(input)).to eql('A-Bb-Ccc')
  end

  it 'takes a four letter input' do
    input = 'aBCd'
    expect(described_class.new.mumble(input)).to eql('A-Bb-Ccc-Dddd')
  end

  it 'takes a five letter input' do
    input = 'QWERTY'
    expect(described_class.new.mumble(input)).to eql('Q-Ww-Eee-Rrrr-Ttttt-Yyyyyy')
  end
end
# rubocop:enable Metrics/BlockLength

require './word_wrapper'

describe WordWrapper do
  it 'checks for valid input' do
    input_text = 'This is an input string consisting of many exciting words thrown together in a pretty random sentence. And here is another sentence of words which are very interesting. It is definitely too long now to be on a single line.'
    line_length_invalid = 'foo'
    line_length = 80
    input_text_int = 20

    expect { described_class.new(input_text, line_length_invalid) }.to raise_error(TypeError)
    expect { described_class.new(input_text_int, line_length_invalid) }.to raise_error(TypeError)

    # These should not raise an error
    described_class.new(input_text_int, line_length)
    described_class.new(input_text, line_length)
  end

  it 'outputs text properly with long input' do
    input_text = 'This is an input string consisting of many exciting words thrown together in a pretty random sentence. And here is another sentence of words which are very interesting. It is definitely too long now to be on a single line.'
    output_text = <<~OUTPUT_TEXT.chomp
      This is an input string consisting of many exciting words
      thrown together in a pretty random sentence. And here is
      another sentence of words which are very interesting. It is
      definitely too long now to be on a single line.
    OUTPUT_TEXT

    line_length = 60
    ww = described_class.new(input_text, line_length)
    expect(ww.output).to eql(output_text)
  end

  it 'outputs text properly with input shorter than line length' do
    input_text = 'This is an input string'
    output_text = <<~OUTPUT_TEXT.chomp
      This is an input string
    OUTPUT_TEXT

    line_length = 60
    ww = described_class.new(input_text, line_length)
    expect(ww.output).to eql(output_text)
  end

  it 'outputs text properly with a bit block input' do
    input_text = 'Herearesomewordswhichareallinoneblockandarenotsplit up in anymeaningfulway'
    output_text = <<~OUTPUT_TEXT.chomp
      Herearesomewordswhic
      hareallinoneblockand
      arenotsplit up in
      anymeaningfulway
    OUTPUT_TEXT

    line_length = 20
    ww = described_class.new(input_text, line_length)
    expect(ww.output).to eql(output_text)
  end

  it 'outputs text properly when line breaks on a space' do
    input_text = 'Here are some words and they are very interesting and they need to be changed'
    output_text = <<~OUTPUT_TEXT.chomp
      Here are some words
      and they are very
      interesting and they
      need to be changed
    OUTPUT_TEXT

    line_length = 20
    ww = described_class.new(input_text, line_length)
    expect(ww.output).to eql(output_text)
  end

  it 'outputs text properly when input text is exactly the line length' do
    input_text = 'Here are some words'
    output_text = <<~OUTPUT_TEXT.chomp
      Here are some words
    OUTPUT_TEXT

    line_length = 19
    ww = described_class.new(input_text, line_length)
    expect(ww.output).to eql(output_text)
  end
end

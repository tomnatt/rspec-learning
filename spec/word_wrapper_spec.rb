require './word_wrapper'

describe 'word wrapper' do
  it 'checks for valid input' do
    input_text = 'This is an input string consisting of many exciting words thrown together in a pretty random sentence. And here is another sentence of words which are very interesting. It is definitely too long now to be on a single line.'
    line_length_invalid = 'foo'
    line_length = 80
    input_text_int = 20

    expect { WordWrapper.new(input_text, line_length_invalid) }.to raise_error(TypeError)
    expect { WordWrapper.new(input_text_int, line_length_invalid) }.to raise_error(TypeError)

    # These should not raise an error
    WordWrapper.new(input_text_int, line_length)
    WordWrapper.new(input_text, line_length)
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
    ww = WordWrapper.new(input_text, line_length)
    expect(ww.output).to eql(output_text)
  end

  it 'outputs text properly with input shorter than line length' do
    input_text = 'This is an input string'
    output_text = <<~OUTPUT_TEXT.chomp
      This is an input string
    OUTPUT_TEXT

    line_length = 60
    ww = WordWrapper.new(input_text, line_length)
    expect(ww.output).to eql(output_text)
  end

  it 'outputs text properly with a bit block input' do
    input_text = 'Herearesomewordswhichareallinoneblockandarenotsplit up in anymeaningfulway'
    output_text = <<~OUTPUT_TEXT.chomp
      Herearesomewordswhic
      hareallinoneblockand
      arenotsplit up in an
      ymeaningfulway
    OUTPUT_TEXT

    line_length = 20
    ww = WordWrapper.new(input_text, line_length)
    expect(ww.output).to eql(output_text)
  end
end

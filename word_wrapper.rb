class WordWrapper
  @input_text = ''
  @line_length = 0

  def initialize(input_text, line_length)
    @input_text = input_text.to_s
    @line_length = line_length

    raise TypeError unless @line_length.is_a? Integer
    raise TypeError unless @input_text.is_a? String
  end

  def output
    start_index = 0
    output = []

    # This will automatically run the first time since start_index = 0
    while start_index < @input_text.length
      output << @input_text.slice(start_index, @line_length)
      start_index += @line_length
    end

    output.join("\n")
  end
end

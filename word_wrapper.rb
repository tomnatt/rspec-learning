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

      if short_remainder(start_index) || end_on_space(start_index) || end_before_space(start_index)
        start_index, output = slice_input_text_into_array(start_index, @line_length, output)

      # If the line contains a space, find the last and split on it
      elsif @input_text.slice(start_index, @line_length).include? ' '
        start_index, output = find_last_space_and_split(start_index, @line_length, output)

      # Otherwise split on line length
      else
        start_index, output = slice_input_text_into_array(start_index, @line_length, output)
      end
    end

    output.join("\n")
  end

  private

  # If the remainder of the line is shorter than desired or already the right length
  def short_remainder(start_index)
    @input_text.length - start_index <= @line_length
  end

  # If the line ends on a space
  def end_on_space(start_index)
    @input_text[start_index + @line_length] == ' '
  end

  # If the line ends just before a space
  def end_before_space(start_index)
    @input_text[start_index + @line_length + 1] == ' '
  end

  # Get a chunk of the input text and put it into output array
  def slice_input_text_into_array(start_index, length, output)
    output << @input_text.slice(start_index, length).strip
    [start_index + length, output]
  end

  # Find the last space and split on it
  def find_last_space_and_split(start_index, length, output)
    line = @input_text.slice(start_index, length)
    space_index = 0
    line.chars.reverse.each.with_index do |c, i|
      if c == ' '
        space_index = @line_length - i
        break
      end
    end

    slice_input_text_into_array(start_index, space_index, output)
  end
end

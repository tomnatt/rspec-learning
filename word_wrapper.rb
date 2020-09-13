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
        output << @input_text.slice(start_index, @line_length).strip
        start_index += @line_length

      # If the line contains a space, find the last and split on it
      elsif @input_text.slice(start_index, @line_length).include? ' '
        line = @input_text.slice(start_index, @line_length)
        space_index = 0
        line.chars.reverse.each.with_index do |c, i|
          if c == ' '
            space_index = @line_length - i
            break
          end
        end

        line = @input_text.slice(start_index, space_index)
        output << line.strip
        start_index += space_index

      # Otherwise split on line length
      else
        output << @input_text.slice(start_index, @line_length).strip
        start_index += @line_length
      end
    end

    output.join("\n")
  end

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
end

class MumbleLetters
  def mumble(input)
    # Reject the input if there are any non-letter characters
    raise TypeError if input =~ /\W+/

    output = []
    input.chars.each.with_index(1) do |c, i|
      output << (c * i).capitalize
    end

    # input.upcase
    output.join('-')
  end
end

class NumberToLcd
  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength
  def output(number)
    # Reject the input if there are any non-numbers
    raise TypeError if number =~ /\D+/

    output = ['', '', '']
    number.to_s.chars.each do |digit|
      case digit
      when '1' then output = one(output)
      when '2' then output = two(output)
      when '3' then output = three(output)
      when '4' then output = four(output)
      when '5' then output = five(output)
      when '6' then output = six(output)
      when '7' then output = seven(output)
      when '8' then output = eight(output)
      when '9' then output = nine(output)
      when '0' then output = zero(output)
      end
    end
    output.join("\n")
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/MethodLength

  private

  # Disable string checking so these are all consistent
  # rubocop:disable Style/StringLiterals
  def one(output)
    output[0] += "\s\s\s"
    output[1] += "\s\s|"
    output[2] += "\s\s|"

    output
  end

  def two(output)
    output[0] += "\s_\s"
    output[1] += "\s_|"
    output[2] += "|_\s"

    output
  end

  def three(output)
    output[0] += "\s_\s"
    output[1] += "\s_|"
    output[2] += "\s_|"

    output
  end

  def four(output)
    output[0] += "\s\s\s"
    output[1] += "|_|"
    output[2] += "\s\s|"

    output
  end

  def five(output)
    output[0] += "\s_\s"
    output[1] += "|_\s"
    output[2] += "\s_|"

    output
  end

  def six(output)
    output[0] += "\s_\s"
    output[1] += "|_\s"
    output[2] += "|_|"

    output
  end

  def seven(output)
    output[0] += "\s_\s"
    output[1] += "\s\s|"
    output[2] += "\s\s|"

    output
  end

  def eight(output)
    output[0] += "\s_\s"
    output[1] += "|_|"
    output[2] += "|_|"

    output
  end

  def nine(output)
    output[0] += "\s_\s"
    output[1] += "|_|"
    output[2] += "\s_|"

    output
  end

  def zero(output)
    output[0] += "\s_\s"
    output[1] += "|\s|"
    output[2] += "|_|"

    output
  end
  # rubocop:enable Style/StringLiterals
end

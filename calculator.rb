class Calculator
  def add(first, second)
    raise TypeError unless first.is_a? Integer
    raise TypeError unless second.is_a? Integer

    first + second
  end
end

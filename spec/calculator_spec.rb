require './calculator'

describe 'calculator' do
  it 'adds numbers' do
    calc = Calculator.new
    expect(calc.add(5, 3)).to eql(8)
    expect(calc.add(2, 3)).to eql(5)
  end

  it 'returns an integer' do
    calc = Calculator.new
    expect(calc.add(2, 3)).to be_instance_of(Integer)
  end

  it 'raises an error if given incorrect type' do
    calc = Calculator.new
    expect { calc.add('foo', 'bar') }.to raise_error(TypeError)
    expect { calc.add('foo', 2) }.to raise_error(TypeError)
    expect { calc.add(4, 'bar') }.to raise_error(TypeError)
  end
end

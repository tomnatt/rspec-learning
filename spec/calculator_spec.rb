require './calculator'

describe Calculator do
  it 'adds two numbers' do
    calc = described_class.new
    expect(calc.add(5, 3)).to be(8)
  end

  it 'adds two other numbers' do
    calc = described_class.new
    expect(calc.add(2, 3)).to be(5)
  end

  it 'returns an integer' do
    calc = described_class.new
    expect(calc.add(2, 3)).to be_instance_of(Integer)
  end

  it 'raises an error if given two incorrect types' do
    calc = described_class.new
    expect { calc.add('foo', 'bar') }.to raise_error(TypeError)
  end

  it 'raises an error if first argument is incorrect type' do
    calc = described_class.new
    expect { calc.add('foo', 2) }.to raise_error(TypeError)
  end

  it 'raises an error if second argument is incorrect type' do
    calc = described_class.new
    expect { calc.add(4, 'bar') }.to raise_error(TypeError)
  end
end

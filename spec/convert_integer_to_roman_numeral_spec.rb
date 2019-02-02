class ConvertIntegerToRomanNumeral
  def execute(integer)
    return x(integer / 10) if [20, 30, 40].include?(integer)

    if integer.between?(1, 3)
      i(integer)
    elsif integer.between?(5, 8)
      'V' + i(integer - 5)
    elsif integer.between?(10, 13)
      'X' + i(integer - 10)
    elsif integer.between?(15, 18)
      'XV' + i(integer - 15)
    end
  end

  private

  def i(integer)
    'I' * integer
  end

  def x(integer)
    'X' * integer
  end
end

RSpec.describe ConvertIntegerToRomanNumeral do
  expectations = {
    1 => 'I',
    2 => 'II',
    3 => 'III',
    5 => 'V',
    6 => 'VI',
    7 => 'VII',
    8 => 'VIII',
    10 => 'X',
    11 => 'XI',
    12 => 'XII',
    13 => 'XIII',
    15 => 'XV',
    16 => 'XVI',
    17 => 'XVII',
    18 => 'XVIII',
    20 => 'XX',
    30 => 'XXX',
    40 => 'XXXX',
  }

  expectations.each do |(integer, roman_numeral)|
    it "produces #{roman_numeral} given #{integer}" do
      expect(subject.execute(integer)).to eq(roman_numeral)
    end
  end
end

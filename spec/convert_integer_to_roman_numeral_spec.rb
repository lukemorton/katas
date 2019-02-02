class ConvertIntegerToRomanNumeral
  def execute(integer)
    roman_numeral = ''

    if integer >= 10
      roman_numeral << x(integer / 10)
      integer = integer % 10
    end

    if integer >= 5
      roman_numeral << v(1)
      integer = integer - 5
    end

    roman_numeral << i(integer)

    roman_numeral
  end

  private

  def i(integer)
    'I' * integer
  end

  def v(integer)
    'V' * integer
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
    21 => 'XXI',
    22 => 'XXII',
    23 => 'XXIII',
    25 => 'XXV',
    26 => 'XXVI',
    27 => 'XXVII',
    28 => 'XXVIII',
    30 => 'XXX',
    31 => 'XXXI',
    32 => 'XXXII',
    33 => 'XXXIII',
    35 => 'XXXV',
    36 => 'XXXVI',
    37 => 'XXXVII',
    38 => 'XXXVIII',
    40 => 'XXXX',
    41 => 'XXXXI',
    42 => 'XXXXII',
    43 => 'XXXXIII',
    45 => 'XXXXV',
    46 => 'XXXXVI',
    47 => 'XXXXVII',
    48 => 'XXXXVIII',
  }

  expectations.each do |(integer, roman_numeral)|
    it "produces #{roman_numeral} given #{integer}" do
      expect(subject.execute(integer)).to eq(roman_numeral)
    end
  end
end

class ConvertIntegerToRomanNumeral
  def execute(integer)
    roman_numeral = ''

    if integer >= 50
      roman_numeral << l(integer / 50)
      integer = integer % 50
    end

    if integer >= 10
      roman_numeral << x(integer / 10)
      integer = integer % 10
    end

    if integer == 9
      roman_numeral << i(1) + x(1)
      integer = integer - 9
    end

    if integer >= 5
      roman_numeral << v(1)
      integer = integer - 5
    end

    if integer == 4
      roman_numeral << i(1) + v(1)
      integer = integer - 4
    end

    roman_numeral << i(integer)
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

  def l(integer)
    'L' * integer
  end
end

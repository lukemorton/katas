class ConvertIntegerToRomanNumeral
  def execute(integer)
    roman_numeral = ''

    if integer >= 1000
      roman_numeral << m(integer / 1000)
      integer = integer % 1000
    end

    if integer >= 900
      roman_numeral << c(1) + m(1)
      integer = integer - 900
    end

    if integer >= 500
      roman_numeral << d(integer / 500)
      integer = integer % 500
    end

    if integer >= 400
      roman_numeral << c(1) + d(1)
      integer = integer - 400
    end

    if integer >= 100
      roman_numeral << c(integer / 100)
      integer = integer % 100
    end

    if integer >= 90
      roman_numeral << x(1) + c(1)
      integer = integer - 90
    end

    if integer >= 50
      roman_numeral << l(integer / 50)
      integer = integer % 50
    end

    if integer >= 40
      roman_numeral << x(1) + l(1)
      integer = integer - 40
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

  def c(integer)
    'C' * integer
  end

  def d(integer)
    'D' * integer
  end

  def m(integer)
    'M' * integer
  end
end

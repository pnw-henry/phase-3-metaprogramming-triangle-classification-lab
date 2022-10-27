class Triangle
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a = a
    @b = b
    @c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def positive_integers?
    [a, b, c].all?(&:positive?)
  end

  def valid_triangle_inequality?
    a + b > c && a + c > b && b + c > a
  end

  def validate_triangle
    raise TriangleError unless positive_integers? && valid_triangle_inequality?
  end
  
  class TriangleError < StandardError
    def message
      "Triangle is invalid"
    end
  end

end

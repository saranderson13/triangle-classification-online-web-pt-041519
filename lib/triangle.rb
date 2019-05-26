class Triangle
  attr_accessor :s1, :s2, :s3, :kind

  def initialize(s1, s2, s3)
    @s1, @s2, @s3 = s1, s2, s3
    @kind = triangle_test
  end

  def triangle_test
    if valid?
      if s1 == s2
        s1 == s3 ? @kind = :equilateral : @kind = :isosceles
      elsif s1 == s3 || s2 == s3
        @kind = :isosceles
      else @kind = :scalene
      end
    else raise TriangleError
    end
  end

  def valid?
    side_array = s1, s2, s3; side_array.sort!
    side_array.all? {|x| x > 0 } && side_array[0] + side_array[1] > side_array[2]
  end

  class TriangleError < StandardError
  end
end

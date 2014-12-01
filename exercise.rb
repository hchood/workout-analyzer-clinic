class Exercise
  attr_reader :category, :duration_in_min

  def initialize(name, category, duration_in_min)
    @name = name
    @category = category
    @duration_in_min = duration_in_min
  end
end

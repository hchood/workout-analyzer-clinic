class Workout
  attr_reader :id, :date, :exercises

  def initialize(id, date, exercises = [])
    @id = id
    @date = date
    @exercises = exercises
  end

  def type
    # if >= 50% cardio exercises, return "cardio"
    # if >= 50% strength exercises, return "strength"
    # otherwise, return "other"
    cardio_count = exercises.count { |ex| ex[:category] == "cardio" }
    strength_count = exercises.count { |ex| ex[:category] == "strength" }

    perc_cardio = cardio_count / exercises.count.to_f
    perc_strength = strength_count / exercises.count.to_f

    if perc_cardio >= 0.50
      "cardio"
    elsif perc_strength >= 0.50
      "strength"
    else
      "other"
    end
  end

  def duration
    total = 0.0

    exercises.each do |ex|
      total += ex[:duration_in_min]
    end

    total
  end

  def calories_burned
    total = 0.0

    exercises.each do |ex|
      if ex[:category] == "cardio"
        cals_burned = ex[:duration_in_min] * 8
      else
        cals_burned = ex[:duration_in_min] * 5
      end

      total += cals_burned
    end

    total
  end
end








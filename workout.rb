class Workout
  attr_reader :id, :date, :exercises

  def initialize(id, date, exercises = [])
    @id = id
    @date = date
    @exercises = exercises
  end
end

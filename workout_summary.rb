require_relative 'workout'
require 'csv'

# create an array of Workout objects
def load_workout_data(filename)
  workouts = []

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout = workouts.find { |wo| wo.id == row[:workout_id] }

    if workout.nil?
      workout = Workout.new(row[:id], row[:date])
      workouts << workout
    end

    exercise = {
      name: row[:exercise],
      category: row[:category],
      duration_in_min: row[:duration_in_min]
    }

    workout.exercises << exercise
  end

  workouts
end

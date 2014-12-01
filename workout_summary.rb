require_relative 'workout'
require_relative 'exercise'
require 'table_print'
require 'pry'
require 'csv'

# create an array of Workout objects
def load_workout_data(filename)
  workouts = []

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout = workouts.find { |wo| wo.id == row[:workout_id] }

    if workout.nil?
      workout = Workout.new(row[:workout_id], row[:date])
      workouts << workout
    end

    exercise = Exercise.new(row[:exercise], row[:category], row[:duration_in_min])
    workout.exercises << exercise
  end

  workouts
end

workouts = load_workout_data('workouts.csv')

tp workouts, :id, :date, :type, :duration, :calories_burned


# frozen_string_literal: true

require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'

class MealRepository < BaseRepository
  private

  def csv_read
    csv_options = { col_sep: ',', headers: :first_row, header_converters: :symbol }
    CSV.foreach(@file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      # Remember csv row objects are similar to hashes, and because of how we've set up our different models, we can simply pass row objects to our initialize and it will create instances with thee properties contained in the row
      @elements << Meal.new(row)
    end
  end

  def csv_write
    CSV.open(@file_path, 'wb') do |csv|
      csv << %w[id name price]
      @elements.each { |meal| csv << [meal.id, meal.name, meal.price] }
    end
  end
end

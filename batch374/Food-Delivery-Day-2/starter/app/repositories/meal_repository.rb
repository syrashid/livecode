# frozen_string_literal: true

require 'csv'
require_relative '../models/meal'
require_relative 'base_repository'
require 'pry'

class MealRepository < BaseRepository
  private

  def csv_read
    csv_options = { col_sep: ',', headers: :first_row, header_converters: :symbol }
    CSV.foreach(@file_path, csv_options) do |row|

      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
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

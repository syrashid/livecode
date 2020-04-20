# frozen_string_literal: true

require_relative 'lion'
require_relative 'meerkat'
require_relative 'warthog'

lionking = []

lionking << Lion.new('Simba')
lionking << Lion.new('Nala')
lionking << Meerkat.new('Timon')
lionking << Warthog.new('Pumbaa')

lionking.each do |animal|
  puts animal.talk
end

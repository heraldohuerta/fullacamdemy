class Plan < ApplicationRecord
  has_many :plans_options
  has_many :options, through: :plans_options
end

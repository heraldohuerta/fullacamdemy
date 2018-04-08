class Plan < ApplicationRecord
  has_many :plans_options
  has_many :options, through: :plans_options

  has_many :course_plans
  has_many :courses, through: :course_plans

  has_many :details
  has_many :users, through: :details
end

class Option < ApplicationRecord
  has_many :plans_options
  has_many :plans, through: :plans_options
  belongs_to :unit
  has_many :panels
end

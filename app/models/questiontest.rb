class Questiontest < ApplicationRecord
  belongs_to :test
  belongs_to :questiontypes
  has_many :alternatives
end

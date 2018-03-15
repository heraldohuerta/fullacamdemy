class Questiontest < ApplicationRecord
  belongs_to :test, inverse_of: :questiontests
  belongs_to :questiontypes
  has_many :alternatives, inverse_of: :questiontests
  accepts_nested_attributes_for :alternatives
end

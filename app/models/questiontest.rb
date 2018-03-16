class Questiontest < ApplicationRecord
  belongs_to :test
  belongs_to :questiontype
  has_many :alternatives
  accepts_nested_attributes_for :alternatives
end

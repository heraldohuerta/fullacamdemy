class Questiontest < ApplicationRecord
  belongs_to :test
  belongs_to :questiontype
  has_many :alternatives, dependent: :destroy
  # accepts_nested_attributes_for :alternatives
end

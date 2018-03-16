class Content < ApplicationRecord
  belongs_to :asignatur
  belongs_to :course
  has_many :tests
end

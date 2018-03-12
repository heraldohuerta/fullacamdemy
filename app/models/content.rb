class Content < ApplicationRecord
  belongs_to :asignatur
  has_many :tests
end

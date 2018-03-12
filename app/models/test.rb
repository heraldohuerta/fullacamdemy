class Test < ApplicationRecord
  belongs_to :content
  belongs_to :asignatur
  belongs_to :course
  has_many :questiontests
end

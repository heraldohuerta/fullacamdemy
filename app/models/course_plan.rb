class CoursePlan < ApplicationRecord
  belongs_to :plan
  belongs_to :course
end

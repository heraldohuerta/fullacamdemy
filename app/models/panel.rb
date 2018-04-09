class Panel < ApplicationRecord
  belongs_to :user
  belongs_to :unit
  belongs_to :plan
  belongs_to :option
end

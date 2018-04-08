class Detail < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  belongs_to :order
end

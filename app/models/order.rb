class Order < ApplicationRecord
  belongs_to :billing, optional: true
  belongs_to :user
  has_many :details
end

class Test < ApplicationRecord
  belongs_to :content     , optional:true
  belongs_to :asignatur   , optional:true
  belongs_to :course      , optional:true
  has_many :questiontests, inverse_of: :tests
  accepts_nested_attributes_for :questiontests

end

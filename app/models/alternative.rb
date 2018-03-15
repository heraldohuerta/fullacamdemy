class Alternative < ApplicationRecord
  belongs_to :questiontest, inverse_of: :alternatives

end

class AddFieldUnitToOption < ActiveRecord::Migration[5.1]
  def change
    add_reference :options, :unit, foreign_key: true
  end
end

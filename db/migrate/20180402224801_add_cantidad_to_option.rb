class AddCantidadToOption < ActiveRecord::Migration[5.1]
  def change
    add_column :options, :cantidad, :integer, default: 0
  end
end

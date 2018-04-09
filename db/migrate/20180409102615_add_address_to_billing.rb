class AddAddressToBilling < ActiveRecord::Migration[5.1]
  def change
    add_column :billings, :address, :string
  end
end

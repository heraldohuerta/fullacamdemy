class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :status
      t.references :billing, foreign_key: true
      t.references :user, foreign_key: true
      t.decimal :total, precision: 5, scale: 2
      t.string :currency

      t.timestamps
    end
  end
end

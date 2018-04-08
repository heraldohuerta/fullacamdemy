class CreateDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :details do |t|
      t.string :payed
      t.string :price
      t.string :quantity
      t.references :user, foreign_key: true
      t.references :plan, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePanels < ActiveRecord::Migration[5.1]
  def change
    create_table :panels do |t|
      t.references :user, foreign_key: true
      t.references :plan, foreign_key: true
      t.references :option, foreign_key: true
      t.integer :cantidad_compra
      t.integer :cantidad_consumida

      t.timestamps
    end
  end
end

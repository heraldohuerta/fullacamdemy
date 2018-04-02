class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string :codigo
      t.string :descripción
      t.float :precio
      t.string :moneda

      t.timestamps
    end
  end
end

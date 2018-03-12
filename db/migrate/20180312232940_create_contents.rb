class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.string :nombre
      t.string :detalle
      t.string :archivo
      t.string :url_file
      t.references :asignatur, foreign_key: true

      t.timestamps
    end
  end
end

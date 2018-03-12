class CreateTests < ActiveRecord::Migration[5.1]
  def change
    create_table :tests do |t|
      t.string :nombre
      t.string :puntajemax
      t.string :puntajeapro
      t.string :detalle
      t.string :archivo
      t.string :url_file
      t.references :content, foreign_key: true
      t.references :asignatur, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end

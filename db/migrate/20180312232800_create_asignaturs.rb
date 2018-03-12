class CreateAsignaturs < ActiveRecord::Migration[5.1]
  def change
    create_table :asignaturs do |t|
      t.string :nombre
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :nombre
      t.string :detealle
      t.string :tiempo
      t.string :foto
      t.string :costo

      t.timestamps
    end
  end
end

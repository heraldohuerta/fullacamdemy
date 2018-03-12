class CreateQuestiontypes < ActiveRecord::Migration[5.1]
  def change
    create_table :questiontypes do |t|
      t.string :tipo
      t.string :descripcion

      t.timestamps
    end
  end
end

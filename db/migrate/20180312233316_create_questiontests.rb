class CreateQuestiontests < ActiveRecord::Migration[5.1]
  def change
    create_table :questiontests do |t|
      t.string :encunciado1
      t.string :enunciado2
      t.references :test, foreign_key: true
      t.references :questiontypes, foreign_key: true

      t.timestamps
    end
  end
end

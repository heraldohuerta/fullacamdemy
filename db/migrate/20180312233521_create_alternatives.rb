class CreateAlternatives < ActiveRecord::Migration[5.1]
  def change
    create_table :alternatives do |t|
      t.string :detallepregunta
      t.boolean :respuesta
      t.references :questiontest, foreign_key: true

      t.timestamps
    end
  end
end

class CreatePlansOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :plans_options do |t|
      t.references :plan, foreign_key: true
      t.references :option, foreign_key: true

      t.timestamps
    end
  end
end

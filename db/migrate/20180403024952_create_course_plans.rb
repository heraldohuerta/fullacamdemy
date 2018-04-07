class CreateCoursePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :course_plans do |t|
      t.references :plan, foreign_key: true
      t.references :course, foreign_key: true

      t.timestamps
    end
  end
end

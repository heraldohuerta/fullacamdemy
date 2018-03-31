class ChangeColumnToQuestiontest < ActiveRecord::Migration[5.1]
  def self.up
      rename_column :questiontests , :questiontypes_id, :questiontype_id
  end
end

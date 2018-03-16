class AddCampoToContent < ActiveRecord::Migration[5.1]
  def change
    add_reference :contents, :course, foreign_key: true
  end
end

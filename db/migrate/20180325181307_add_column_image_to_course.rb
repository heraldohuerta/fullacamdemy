class AddColumnImageToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :firmware_image, :binary, :limit => 10.megabyte
    add_column :courses, :firmware_image_filename, :string
  
  end
end

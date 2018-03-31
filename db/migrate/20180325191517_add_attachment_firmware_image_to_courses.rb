class AddAttachmentFirmwareImageToCourses < ActiveRecord::Migration[5.1]
  def self.up
    change_table :courses do |t|
      t.attachment :firmware_image
    end
  end

  def self.down
    remove_attachment :courses, :firmware_image
  end
end

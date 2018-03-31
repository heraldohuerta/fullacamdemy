class Course < ApplicationRecord
  has_many :asignaturs
  has_attached_file :firmware_image, :styles => { :medium => "300x300#", :thumb => "200x200#" }
  validates_attachment_content_type :firmware_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end

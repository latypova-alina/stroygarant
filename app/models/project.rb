class Project < ActiveRecord::Base
  
  validates_presence_of :name, :address, :latitude, :longitude
  
  has_many :project_images

  accepts_nested_attributes_for :project_images, allow_destroy: true
  
end

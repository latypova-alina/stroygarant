class ProjectImage < ActiveRecord::Base
  
  belongs_to :project

  has_attached_file :attachment,
                    :styles => {medium: "300x300>", square: "90x90#", big: "603x336#", small: "158x89#" }

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
  
end

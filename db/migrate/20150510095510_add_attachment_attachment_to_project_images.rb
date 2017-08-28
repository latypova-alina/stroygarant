class AddAttachmentAttachmentToProjectImages < ActiveRecord::Migration
  def self.up
    change_table :project_images do |t|
      t.attachment :attachment
    end
  end

  def self.down
    remove_attachment :project_images, :attachment
  end
end

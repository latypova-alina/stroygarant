ActiveAdmin.register Project do
  
  config.filters = false
  
  menu priority: 3

  permit_params :name, :address, :description, :latitude, :longitude, project_images_attributes: [:id, :attachment, :_destroy]
  
  form do |f|
    
    f.inputs do 
      f.input :name
      f.input :address
      f.input :description
      f.input :latitude
      f.input :longitude
    end

    f.inputs do
      f.has_many :project_images, allow_destroy: true do |p|
        p.input :attachment, :as => :file, :label => "Изображение", :hint => p.template.image_tag(p.object.attachment.url(:big))
      end
    end
    
    actions
    
  end
  
  index do 
    
    column :name 
    column :address 
    column :latitude
    column :longitude
    
    actions
    
  end

  show do
    attributes_table do
      row :name
      row :address
      row :description 
      row :latitude 
      row :longitude
    end
  end

end

ActiveAdmin.register Vendor do
  
  menu priority: 2
  
  config.filters = false

  permit_params :name

  show do
    attributes_table do
      row :name
    end
  end
  
  index do 
    column :name 
    
    actions
  end

end

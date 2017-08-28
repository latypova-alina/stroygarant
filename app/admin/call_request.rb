ActiveAdmin.register CallRequest do

  config.clear_action_items!

  config.sort_order = 'id_desc'

  menu priority: 4
  
  filter :name 
  filter :phone 
  filter :created_at
  
  index do

    column :created_at
    column :name
    column :phone
    
  end

end

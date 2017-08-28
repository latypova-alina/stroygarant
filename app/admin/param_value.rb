ActiveAdmin.register ParamValue do

  belongs_to :param_type
  
  config.filters = false
  
  permit_params :name, :color

  sortable
  
  form do |f|
    
    f.inputs do 
      f.input :param_type
      f.input :name
      f.input :color
    end
    
    actions
    
  end

  show do
    attributes_table do
      row :name
      row :param_type
    end
  end

  index :as => :sortable do

    label :name

    actions defaults: false do |value|
      a link_to 'Изменить', edit_admin_param_type_param_value_path(value.param_type, value)
      a link_to 'Удалить', admin_param_type_param_value_path(value.param_type, value), method: :delete
    end

  end

end

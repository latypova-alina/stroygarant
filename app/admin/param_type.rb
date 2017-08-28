ActiveAdmin.register ParamType do
  
  belongs_to :category
  navigation_menu :category
  
  config.filters = false
  
  permit_params :name

  sortable

  show do
    attributes_table do
      row :name
      row :category
    end
  end

  index :as => :sortable do
    
    label :name

    actions defaults: false do |type|
      a link_to 'Значения', admin_param_type_param_values_path(type)
      a link_to 'Изменить', edit_admin_category_param_type_path(type.category, type)
      a link_to 'Удалить', admin_category_param_type_path(type.category, type), method: :delete
    end
    
  end
  
  form do |f|
    
    f.inputs do 
      f.input :category 
      f.input :name
    end
    
    actions
    
  end
  
end

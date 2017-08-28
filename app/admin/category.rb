ActiveAdmin.register Category do

  sortable tree: true

  config.sort_order = 'position_asc'
  config.paginate   = false
  config.filters = false

  menu label: 'Каталог', priority: 1
  
  permit_params :name

  show do
    attributes_table do
      row :name
    end
  end
  
  form do |f|
    
    f.inputs do 
      f.input :name
    end
    
    actions
    
  end

  index as: :sortable do

    label :name

    actions defaults: false do |category|

      unless category.children.exists?
        a link_to 'Товары', admin_category_products_path(category)
        a link_to 'Параметры', admin_category_param_types_path(category)
      end

      a link_to 'Изменить', edit_admin_category_path(category)
      a link_to 'Удалить', admin_category_path(category), method: :delete
    end

  end

end

ActiveAdmin.register Product do

  belongs_to :category
  
  permit_params :name, :price, :category_id, :vendor_id, :image, :units

  form partial: "form"
  
  filter :vendor
  
  index do 
    column :name
    column :price
    column :vendor
    
    actions
  end
  
  show do
    attributes_table do
      row :name
      row :price 
      row :category
      row :vendor
    end
  end
  
  controller do 
    
    def update
      
      update! do
        params[:params].each do |value|
          parameter = @product.product_params.find_by(param_type_id: value[0])
          
          if parameter
            if value[1].to_i > 0
              parameter.param_value_id = value[1]
              parameter.save
            else
              parameter.delete
            end
          else
            if value[1].to_i > 0
              parameter = ProductParam.new
              parameter.product = @product
              parameter.param_type_id = value[0]
              parameter.param_value_id = value[1]
              parameter.save
            end
          end
          
        end
        
        redirect_to admin_category_products_path(@product.category) and return
      end
      
    end
    
  end

end

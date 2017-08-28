class ApplicationController < ActionController::Base
  
  include ApplicationHelper
  
  def tree 
    
    @tree = CatalogTree.new
    @data = @tree.get_categories()
    
    render json: @data
    
  end
  
  def products 
    
    @category = Category.find params[:category_id]
    @selected_params = params[:selected_params]
    @products = []
    
    @category.products.each do |product|

      satisfies = true
      
      @selected_params.each do |type, value|
        unless product.product_params.where(param_type_id: type).where(param_value_id: value).exists?
          satisfies = false
        end
      end
      
      if satisfies
        
        @products.push({
                          id: product.id,
                          name: product.name,
                          price: product.price,
                          units: product.units,
                          image: product.image.url(:calc)
                      })
        
      end
      
    end
    
    render json: @products
    
  end
  
  def projects 
    
    @projects = Project.all
    
  end
  
  def call_request 
    
    @call_request = CallRequest.new
    
    @call_request.name = params[:name]
    @call_request.phone = params[:phone]
    
    if @call_request.save 
      render json: {success: true}, status: 201
    else
      render json: {error: true}, status: 422
    end
    
  end
  
end

class CatalogTree
  
  def get_categories(parent = nil)
    
    tree = []
    
    if parent
      categories = parent.children
    else
      categories = Category.roots
    end
    
    categories.each do |category|
      
      c = {
          id: category.id,
          name: category.name,
          type: :category
      }
      
      if category.children.exists?
        children = get_categories(category)
        params = nil
      else
        children = nil
        params = get_params(category)
      end
      
      c[:children] = children
      c[:params] = params
      
      tree.push(c)
      
    end
    
    tree
    
  end
  
  def get_params(category)
    
    tree = []
    
    category.param_types.each do |type|
      values = []
      
      type.param_values.each do |value|
        values.push({
          id: value.id,
          name: value.name,
          color: value.color,
          type: :param_value
        })
      end
      
      tree.push({
        id: type.id,
        name: type.name,
        type: :param_type,
        values: values
      })
    end
    
    tree
    
  end
  
end
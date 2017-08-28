class ProductParam < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :param_type
  belongs_to :param_value
  
end

class Category < ActiveRecord::Base
  
  has_many :param_types
  has_many :products

  has_ancestry
  
end

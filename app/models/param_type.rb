class ParamType < ActiveRecord::Base
  
  belongs_to :category
  has_many :param_values
  
end

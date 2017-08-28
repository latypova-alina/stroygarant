class Product < ActiveRecord::Base
  
  validates_presence_of :name, :vendor, :price, :units
  
  belongs_to :category
  belongs_to :vendor
  has_many :product_params

  has_attached_file :image, :styles => { :medium => "212x116>", :calc => "212x116#", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image
  
  class << self 
    
    def available_units
      {
          'Штуки' => :pieces,
          'Квадратные метры' => :square_meters,
          'Кубические метры' => :cubic_meters
      }
    end
    
  end
  
end

class CallRequest < ActiveRecord::Base
  
  validates_presence_of :name, :phone
  
  after_create do |call_request|
    MainMailer.call_request(call_request).deliver_now
  end
  
end

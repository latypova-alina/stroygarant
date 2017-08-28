Rails.application.routes.draw do
  
  mount_activeadmin_settings()
  get 'tree', to: 'application#tree'
  get 'products', to: 'application#products'
  get 'projects', to: 'application#projects'
  post 'call_request', to: 'application#call_request'
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
end

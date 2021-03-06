Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'rooms#index'

  resources :blogs
  resources :rooms
  resources :messages
end

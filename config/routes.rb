Blogger::Application.routes.draw do
  devise_for :admins, :controllers => { :registrations => "registrations" }
  root 'static_pages#home'
  match '/help',     to: 'static_pages#help',       via: 'get'
  match '/blog',    to: 'articles#index',      via: 'get'
  match '/users',    to: 'users#index',      via: 'get'
  match '/users/:id',     to: 'users#show',       via: 'get'
  match '/tinymce_assets',     to: 'tinymce_assets#create',      via: 'post'
  devise_for :users, :controllers => { :registrations => "registrations" }, :path_prefix => 'd'
  resources :users, :only =>[:show]
  resources :articles do
    resources :comments
  end
  resources :tags

end

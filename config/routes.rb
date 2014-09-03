Blogger::Application.routes.draw do
  root :to => 'articles#index'

  resources :articles do
    resources :comments
  end
  resources :tags

  post '/tinymce_assets' => 'tinymce_assets#create'

end

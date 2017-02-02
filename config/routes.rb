Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :center_attachments
  devise_for :users
  resources :centers do
    resources :reviews, except: [:index, :show]
    collection do
      get 'search'
    end
  end
  root 'centers#index'

  resources :categories

  get '/about_us',   to: 'pages#about_us'
  get '/contact_us', to: 'pages#contact_us'
  get '/massage',    to: 'pages#massage'
  get '/yoga',       to: 'pages#yoga'
  get '/coaching',   to: 'pages#coaching'
  get '/tagsadmin',   to: 'pages#tagsadmin'

  resources :tags do
    get ':name' => 'tags#show', as: 'tag'
  end
end

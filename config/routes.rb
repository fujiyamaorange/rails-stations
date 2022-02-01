Rails.application.routes.draw do
  namespace :admin do
    get 'movies' => 'movies#index'
    post 'movies' => 'movies#create'
    get 'movies/new' => 'movies#new'
    put 'movies/:id' => 'movies#update'
    delete 'movies/:id' => 'movies#destroy'
    get 'movies/:id/edit' => 'movies#edit'
  end
  get 'movies' => 'movies#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

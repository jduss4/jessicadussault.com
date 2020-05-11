Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get '/', to: 'general#index', as: 'home'
  get 'about', to: 'general#about', as: 'about'
  get 'posts', to: 'posts#index', as: 'posts'
  get 'post/:id', to: 'posts#show', as: 'post'
  get 'weather', to: 'general#weather', as: 'weather'
end

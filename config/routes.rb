Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  get '/', to: 'general#index', as: 'home'
  get 'weather', to: 'general#weather', as: 'weather'
end

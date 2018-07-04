Rails.application.routes.draw do
  resources :songs, only: [:index, :new, :create, :show, :edit, :update]
  get '/songs/:id/delete', to: 'songs#destroy', as: 'delete'

root to: 'songs#index'
end

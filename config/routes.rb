Rails.application.routes.draw do
  root 'docs#index'
  resources :tasks, except: [:new, :edit]
end

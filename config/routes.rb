Rails.application.routes.draw do
  root 'docs#index'
  resources :projects, except: [:new, :edit] do
    resources :tasks, except: [:new, :edit]
  end
end

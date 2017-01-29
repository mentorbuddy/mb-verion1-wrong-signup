Rails.application.routes.draw do
  devise_for :universities

  resources :universities, only: [:index, :show] do
  	resources :mentors
  end

  authenticated :university do
  	root 'universities#dashboard', as: "authenticated_root"
  end

  root 'welcome#index'
end

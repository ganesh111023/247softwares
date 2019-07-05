Rails.application.routes.draw do
  get 'about' => 'pages#about'
  get 'services' => 'pages#services'
  get 'portfolio' => 'pages#portfolio'
  get 'career' => 'pages#career'
  get 'team' => 'pages#team'
  get 'technology' => 'pages#technology'
  get 'blog' => 'pages#blog'
  get 'contact' => 'pages#contact'
  root to: 'welcome#index'
  resources "contacts", only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

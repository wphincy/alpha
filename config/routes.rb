Rails.application.routes.draw do

  devise_for :authors
  root to: 'gallery/posts#index'

  namespace :authors do
    resources :posts do
      put 'publish' => 'posts#publish', on: :member
      put 'unpublish' => 'posts#unpublish', on: :member
    end
end

  scope module: 'gallery' do
    get 'about' => 'pages#about', as: :about
    get 'contact' => 'pages#contact', as: :contact
    get 'welcome' => 'pages#welcome', as: :welcome
    get 'video' => 'pages#video', as: :video
    get 'photo' => 'pages#photo', as: :photo
    get 'posts' => 'posts#index', as: :posts
    get 'posts/:id' => 'posts#show', as: :post

  end








  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

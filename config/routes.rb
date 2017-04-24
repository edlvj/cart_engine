CartEngine::Engine.routes.draw do
  resources :carts, only: [:index, :create, :destroy] do
    collection do
      match 'update', to: 'carts#update', via: :put, as: :update
    end
  end
  resources :checkout, only: [:show, :update]
end

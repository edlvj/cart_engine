Rails.application.routes.draw do
  mount CartEngine::Engine => "/cart_engine"
end

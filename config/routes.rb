Rails.application.routes.draw do
  resources :messages, defaults: { format: :json }
end

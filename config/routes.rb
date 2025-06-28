LetterThief::Engine.routes.draw do
  resources :email_messages, only: [:index, :create, :show, :destroy] do
    delete :destroy_all, on: :collection
  end
  root "email_messages#index"
end

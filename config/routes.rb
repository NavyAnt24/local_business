Localbusiness::Application.routes.draw do
  resources :users
  resource :session, :only => [:create, :destroy, :new]

  root :to => "session#new"
end

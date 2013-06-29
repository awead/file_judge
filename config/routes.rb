FileJudge::Application.routes.draw do
  root 'cases#index'
  resources :cases
end

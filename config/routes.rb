FileJudge::Application.routes.draw do
  root 'cases#index'
  resources :cases do
    collection do
      get 'query'
    end
  end
end

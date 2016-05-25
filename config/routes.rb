Rails.application.routes.draw do
  root to: 'homes#index'

  resources 'simulations', :only => %w[] do
    collection do
      get 'glycemic_graph'
    end
  end
end

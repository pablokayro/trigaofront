Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  # Produtos
  resources :produtos do
    collection do
      get 'busca', to: 'produtos#search'
    end
  end

  # Encomendas
  resources :encomendas

  # Relatórios
  get 'relatorios/produtos_vendidos', to: 'relatorios#produtos_vendidos'
  get 'relatorios/paes_vendidos', to: 'relatorios#paes_vendidos'

  # Ajustando a rota inicial para a página de login do Devise
  authenticated :user do
    root to: "produtos#index", as: :authenticated_root
  end

  unauthenticated do
    root to: 'devise/sessions#new', as: :unauthenticated_root
  end
end

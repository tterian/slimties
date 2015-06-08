Rails.application.routes.draw do
  root 'static_pages#index'

  devise_for  :users,
              path: '', # Use shallow paths
              path_names: {
                sign_in: 'login',
                sign_out: 'logout',
                sign_up: 'join'
              },
              controllers: {
                omniauth_callbacks: 'omniauth_callbacks'
              }

  scope '/user/:user_id' do
    resources :posts
  end



end

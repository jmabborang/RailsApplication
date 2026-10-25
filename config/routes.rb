Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Smoke-test endpoints
  get 'test', to: 'test#show'

  # Authentication
  post 'api/v1/auth/login', to: 'auth#login'
  get 'api/v1/auth/me', to: 'auth#me'
  post 'api/v1/auth/heartbeat', to: 'auth#heartbeat'
  post 'api/v1/auth/idle_expire', to: 'auth#idle_expire'
  post 'api/v1/auth/activity', to: 'auth#activity'
  post 'api/v1/auth/refresh', to: 'auth#refresh'
  post 'api/v1/auth/logout', to: 'auth#logout'
  get 'department/list', to: 'department#list'
end

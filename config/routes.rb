Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  post "/register", to: "users#register"
  post "/login", to: "users#login"
  get  "/list_users", to: "users#list_users"
  post "/task_creation", to: "tasks#task_creation"
  get  "/list_tasks", to: "tasks#list_tasks"
  get "/list_tasks_by_id", to: "tasks#list_tasks_by_id"
  patch "/update_task_by_id", to: "tasks#update_task_by_id"
  delete "/delete_task_by_id", to: "tasks#delete_task_by_id"
end

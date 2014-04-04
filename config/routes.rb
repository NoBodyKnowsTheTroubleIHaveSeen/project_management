ProjectManagement::Application.routes.draw do
  get "management/goto_update_task"
  get "management/update_task"
  get "management/update_project"
  get "share/file_share"
  get "share/question_answer"
  get "base_information/notice"
  get "base_information/relation"
  get "management/project_management"
  get "management/plan"
  get "management/task_distribute"
  get "management/schedule_submit"
  get "management/schedule_summary"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #index page.
  root 'welcome#index'

  # Example of regular route:
  #register page.
  get 'register' => 'register#index'
  post 'register' => 'register#register'
  #logout
  get 'logout' => 'welcome#logout'

  #login page.
  get 'login' => 'login#index'
  post 'login' => 'login#login'

  #action controller page.
  #project operation
  get 'gotoAddProject' => 'management#goto_add_project'
  post 'addProject' => 'management#add_project'
  get 'gotoUpdateProject' => 'management#goto_update_project'
  post 'updateProject' => 'management#update_project'
  post 'deleteProject' => 'management#delete_project'
  post 'getProjectPeople' => 'management#get_project_people'

  #plan operation.
  post 'addPlan' => 'management#add_plan'
  #task operation.
  post 'addTask' => 'management#add_task'
  get 'gotoAddTask' => 'management#goto_add_task'
  get 'gotoUpdateTask' => 'management#goto_update_task'
  post 'updateTask' => 'management#update_task'
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

Rails.application.routes.draw do
  root 'posts#index'

# 1. Create
  get 'users/signup'
  post 'users/signup' => 'users#create'
# 2. Read
  get 'users/login' => 'users#login'
  post 'users/login' => 'users#sessions'

# 3. Update
  get 'users/edit/:id' => 'users#edit'
  put 'users/:id' => 'users#update'

# 4. Destroy
  delete 'users' => 'users#logout'
  
  get 'users/admin' => 'users#admin'
  delete 'users/:id' => 'users#destroy'





# 1. Create
  get 'posts/new' 
  post 'posts' => 'posts#create'
  
# 2. Read
  get 'posts/show/:id' => 'posts#show'

# 3. Update
  get 'posts/edit/:id' => 'posts#edit'
  put 'posts/:id' => 'posts#update'

# 4. Destroy
  delete 'posts/:id' => 'posts#destroy'
  
end

## get put delete post

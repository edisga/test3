Rails.application.routes.draw do
  devise_for :teachers
  devise_for :users
  root to: 'pages#home'
  
  #teacher routes
  

end

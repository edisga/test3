Rails.application.routes.draw do
  devise_for :teachers
  devise_for :users

  root to: 'pages#home'
 
  resources :teachers, only: [:show, :edit, :update, :destroy] do
    member do
      get :my_courses
    end
  end
  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
      get :my_courses
    end
  end

  resources :courses do
    resources :moduls, except: [:show] do
      resources :lessons, except: [:index, :new, :edit] do
        resources :sections, except: [:index]

        resources :questions, except: [:show] do
          resources :answers, except: [:index, :show]
        end
      end
    end
  end

end

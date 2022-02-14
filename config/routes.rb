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
        resources :sections, except: [:index] do
          resources :elements, only: [:create, :update, :destroy]
        end
      end

      resources :questions, except: [:show] do
        resources :answers, except: [:index, :show, :new, :edit]
      end
    end

    resources :atributions, except: [:index, :show]
    resources :requirements, except: [:index, :show]
    resources :features, except: [:index, :show]

  end

  resources :tests, only: [:new, :create, :show]
end

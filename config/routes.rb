Rails.application.routes.draw do
  devise_for :teachers
  devise_for :users
  root to: 'pages#home'
  

  resources :courses do
    resources :modules, except: [:show] do
      resources :lessons, except: [:show] do
        resources :sections, except: [:show]
      end

      resources :questions, except: [:show] do
        resources :answers, except: [:index, :show]
      end
    end
  end

end

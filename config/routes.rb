Rails.application.routes.draw do
  devise_for :teachers
  devise_for :users
  root to: 'pages#home'
  

  resources :courses do
    resources :moduls, except: [:show] do
      resources :lessons, except: [:index] do
        # resources :sections, except: [:show]

        # resources :questions, except: [:show] do
        #   resources :answers, except: [:index, :show]
        # end
      end
    end
  end

end

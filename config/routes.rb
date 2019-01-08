Rails.application.routes.draw do  
  resources :logbooks do
    resources :logbook_pages
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

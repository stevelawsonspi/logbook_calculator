Rails.application.routes.draw do
  resources :logbook_entries
  resources :logbook_pages
  resources :logbooks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  
  resources :voter_record_imports, only: [:index, :create, :update]
  
  root to: "voter_record_imports#index"
  
end

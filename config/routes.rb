Rails.application.routes.draw do
  resources :doctors, only: [:show]
  resources :hospitals, only: [:show]
  resources :patients, only: [:destroy, :index]

  delete "/doctors/:doctor_id/patients/:patient_id", to: "patients#delete"
end

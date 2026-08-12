# == Routes (the "Router" in MVC) ==
# A route maps an HTTP request (method + path) to a controller action.
# Run `bin/rails routes` to see the full table.
Rails.application.routes.draw do
  root "notes#index"

  # A RESTful resource: NotesController handles index/show/new/create/edit/update/destroy
  resources :notes do
    # Comments live "inside" a note, so their routes are nested:
    #   POST   /notes/:note_id/comments     -> comments#create
    #   DELETE /notes/:note_id/comments/:id -> comments#destroy
    resources :comments, only: %i[create destroy]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end

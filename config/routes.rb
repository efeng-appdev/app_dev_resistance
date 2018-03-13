Rails.application.routes.draw do
  # Routes for the Role resource:
  # CREATE
  get "/roles/new", :controller => "roles", :action => "new"
  post "/create_role", :controller => "roles", :action => "create"

  # READ
  get "/roles", :controller => "roles", :action => "index"
  get "/roles/:id", :controller => "roles", :action => "show"

  # UPDATE
  get "/roles/:id/edit", :controller => "roles", :action => "edit"
  post "/update_role/:id", :controller => "roles", :action => "update"

  # DELETE
  get "/delete_role/:id", :controller => "roles", :action => "destroy"
  #------------------------------

  # Routes for the Mission resource:
  # CREATE
  get "/missions/new", :controller => "missions", :action => "new"
  post "/create_mission", :controller => "missions", :action => "create"

  # READ
  get "/missions", :controller => "missions", :action => "index"
  get "/missions/:id", :controller => "missions", :action => "show"

  # UPDATE
  get "/missions/:id/edit", :controller => "missions", :action => "edit"
  post "/update_mission/:id", :controller => "missions", :action => "update"

  # DELETE
  get "/delete_mission/:id", :controller => "missions", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

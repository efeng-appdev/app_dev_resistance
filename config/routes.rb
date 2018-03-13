Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "missions#index"
  # Routes for the Mission_participant resource:
  # CREATE
  get "/mission_participants/new", :controller => "mission_participants", :action => "new"
  post "/create_mission_participant", :controller => "mission_participants", :action => "create"

  # READ
  get "/mission_participants", :controller => "mission_participants", :action => "index"
  get "/mission_participants/:id", :controller => "mission_participants", :action => "show"

  # UPDATE
  get "/mission_participants/:id/edit", :controller => "mission_participants", :action => "edit"
  post "/update_mission_participant/:id", :controller => "mission_participants", :action => "update"

  # DELETE
  get "/delete_mission_participant/:id", :controller => "mission_participants", :action => "destroy"
  #------------------------------

  # Routes for the Mission_vote resource:
  # CREATE
  get "/mission_votes/new", :controller => "mission_votes", :action => "new"
  post "/create_mission_vote", :controller => "mission_votes", :action => "create"

  # READ
  get "/mission_votes", :controller => "mission_votes", :action => "index"
  get "/mission_votes/:id", :controller => "mission_votes", :action => "show"

  # UPDATE
  get "/mission_votes/:id/edit", :controller => "mission_votes", :action => "edit"
  post "/update_mission_vote/:id", :controller => "mission_votes", :action => "update"

  # DELETE
  get "/delete_mission_vote/:id", :controller => "mission_votes", :action => "destroy"
  #------------------------------

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

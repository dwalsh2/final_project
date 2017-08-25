Rails.application.routes.draw do
  
  root "routes#index"
  
  devise_for :users
  
  get "/my_bookmarks/:id", :controller => "bookmarks", :action => "favorites"
  
  get "/my_routes/:id", :controller => "routes", :action => "favorites"
  
  # Routes for the Bookmark resource:
  # CREATE
  get "/bookmarks/new", :controller => "bookmarks", :action => "new"
  post "/create_bookmark", :controller => "bookmarks", :action => "create"

  # READ
  get "/bookmarks", :controller => "bookmarks", :action => "index"
  get "/bookmarks/:id", :controller => "bookmarks", :action => "show"

  # UPDATE
  get "/bookmarks/:id/edit", :controller => "bookmarks", :action => "edit"
  post "/update_bookmark/:id", :controller => "bookmarks", :action => "update"

  # DELETE
  get "/delete_bookmark/:id", :controller => "bookmarks", :action => "destroy"
  #------------------------------
  
  # Routes for the Waypoint resource:
  # CREATE
  get "/waypoints/new", :controller => "waypoints", :action => "new"
  post "/create_waypoint", :controller => "waypoints", :action => "create"

  # READ
  get "/waypoints", :controller => "waypoints", :action => "index"
  get "/waypoints/:id", :controller => "waypoints", :action => "show"

  # UPDATE
  get "/waypoints/:id/edit", :controller => "waypoints", :action => "edit"
  post "/update_waypoint/:id", :controller => "waypoints", :action => "update"

  # DELETE
  get "/delete_waypoint/:id", :controller => "waypoints", :action => "destroy"
  #------------------------------

  # Routes for the Business resource:
  # CREATE
  get "/businesses/new", :controller => "businesses", :action => "new"
  post "/create_business", :controller => "businesses", :action => "create"

  # READ
  get "/businesses", :controller => "businesses", :action => "index"
  get "/businesses/:id", :controller => "businesses", :action => "show"

  # UPDATE
  get "/businesses/:id/edit", :controller => "businesses", :action => "edit"
  post "/update_business/:id", :controller => "businesses", :action => "update"

  # DELETE
  get "/delete_business/:id", :controller => "businesses", :action => "destroy"
  #------------------------------

  # Routes for the Route resource:
  # CREATE
  get "/routes/new", :controller => "routes", :action => "new"
  post "/create_route", :controller => "routes", :action => "create"

  # READ
  get "/routes", :controller => "routes", :action => "index"
  get "/routes/:id", :controller => "routes", :action => "show"

  # UPDATE
  get "/routes/:id/edit", :controller => "routes", :action => "edit"
  post "/update_route/:id", :controller => "routes", :action => "update"

  # DELETE
  get "/delete_route/:id", :controller => "routes", :action => "destroy"
  #------------------------------
  
  # Routes for the Users:
  # LIST
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show" 
  #------------------------------

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount WebGit::Engine, at: "/rails/git"
end

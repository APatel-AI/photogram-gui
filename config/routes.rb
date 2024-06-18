Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})
  post("/add_user", {:controller => "users", :action => "create"})
  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_username", { :controller => "users", :action => "show"})

  #photos

  get("/photos", { :controller => "photos", :action => "index"})
  post("/insert_photo", {:controller => "photos", :action => "create"})
  post("/update_photo/:path_id", { :controller => "photos", :action => "update" })
  get("/photos/:path_id", { :controller => "photos", :action => "show"})
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })





end

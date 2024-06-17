Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})
  post("/add_user", {:controller => "users", :action => "create"})
  get("/users", { :controller => "users", :action => "index"})
  get("/users/:path_id", { :controller => "users", :action => "show"})

  #photos

  get("/photos", { :controller => "photos", :action => "index"})
  post("/insert_photo", {:controller => "photos", :action => "create"})
  get("/photos/:path_id", { :controller => "photos", :action => "show"})




end

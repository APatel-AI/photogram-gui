Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index"})
  post("/add_user", {:controller => "users", :action => "create"})
  get("/users", { :controller => "users", :action => "index"})

  #photos

  get("/photos", { :controller => "photos", :action => "index"})
  post("/insert_photo", {:controller => "photos", :action => "create"})




end

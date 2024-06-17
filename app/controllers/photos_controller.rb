class PhotosController < ApplicationController

  
  def index
    @photos = Photo.all.order({ :created_at => :desc })

    render({ :template => "photos/index"})
  end

  def show
    the_id = params.fetch("path_id")
    @photo = Photo.where({:id => the_id }).at(0)

    render({ :template => "photos/show" })
  end

  def create
    @photo = User.new
    @photo.url = params.fetch("input_image")
    @photo.caption = params.fetch("input_caption")
    @photo.userId = params.fetch("input_owner_id")


    if @photo.valid?
      @photo.save
      redirect_to("/photos", { :notice => "photo created successfully." })
    else
      redirect_to("/photos", { :notice => "photo failed to create successfully." })
    end


  end
end

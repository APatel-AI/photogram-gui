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
    
    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")
    @photo = Photo.new
    @photo.image = input_image
    @photo.caption = input_caption
    # @photo.owner_id = input_owner_id
    @photo.save

    redirect_to("/photos")

  end


end

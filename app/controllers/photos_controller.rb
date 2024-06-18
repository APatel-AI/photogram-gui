class PhotosController < ApplicationController
  def index

    matching_photos = Photo.all
    @photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photos/index"})
  end

  def show
    the_id = params.fetch("path_id")

    matching_photos_ids = Photo.where({:id => the_id})

    @photo = matching_photos_ids.first

    if @photo == nil
      redirect_to("/users")
    else
      render({ :template => "photos/show" })
    end
  end



  def destroy
    the_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => the_id })

    @photo = matching_photos.at(0)

    @photo.destroy

    # render({ :template => "photo_templates/destroy" })
    redirect_to("/photos")
  end

  def create

    input_image = params.fetch("input_image")
    input_caption = params.fetch("input_caption")
    input_owner_id = params.fetch("input_owner_id")
    
    a_new_photo = Photo.new

    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    # render({ :template => "photo_templates/post"})
    redirect_to("/photos/#{a_new_photo.id}")
  end

  # def update
  #   edit_image_input = params.fetch("edit_image_input")
  #   edit_caption_input = params.fetch("edit_caption_input")
  #   updated_image_id = params.fetch("path_id")

  #   updated_photo = Photo.where({ :id => updated_image_id }).first
  #   updated_photo.image = edit_image_input
  #   updated_photo.caption = edit_caption_input

  #   updated_photo.save

  #   redirect_to("/photos/#{updated_image_id}")
  # end


end

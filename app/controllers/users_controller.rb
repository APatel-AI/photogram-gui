class UsersController < ApplicationController

  # display users list
  def index

    matching_users = User.all
    @users = matching_users.order({ :username => :asc})

    render({ :template => "users/index" })
  end

  def show
    
    the_username = params.fetch("path_username")
    matching_usernames = User.where({:username => the_username })

    @user = matching_usernames.first

    if @user == nil
      redirect_to("/users", { :notice => "Student failed to create successfully." })
    else
      
      render({ :template => "users/show" })
    end
      
  end

  def create

    username_input = params.fetch("input_username")

    new_user = User.new

    new_user.username = username_input

    new_user.save

    redirect_to("/users/#{username_input}")

  end


  def update
    
    edit_username_input = params.fetch("input_username")
    edited_user_id = params.fetch("path_id")

    updated_user = User.where({ :id => edited_user_id }).first
    updated_user.username = edit_username_input
    
    updated_user.save

    redirect_to("/users/#{updated_user.username}")
  end
end

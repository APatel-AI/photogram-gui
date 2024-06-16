class UsersController < ApplicationController

  # display users list
  def index
    @users = User.all.order({ :created_at => :desc })

    render({ :template => "users/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @user = User.where({:id => the_id }).at(0)

    render({ :template => "users/show" })
  end

  def create

    @user = User.new
    @user.username = params.fetch("input_username")


    if @user.valid?
      @user.save
      redirect_to("/users", { :notice => "Student created successfully." })
    else
      redirect_to("/users", { :notice => "Student failed to create successfully." })
    end



  end
end

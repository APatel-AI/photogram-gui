class UsersController < ApplicationController

  def index
    @users = User.all.order({ :created_at => :desc })

    render({ :template => "users/index" })
  end

  def show
    the_id = params.fetch("path_id")
    @user = User.where({:id => the_id }).at(0)

    render({ :template => "users/show" })
  end
end

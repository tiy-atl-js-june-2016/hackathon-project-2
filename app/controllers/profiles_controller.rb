class ProfilesController < ApplicationController

  before_action :authenticate!, only: [:create, :edit]

  def create
    @profile = Profile.new(
      github_username: params["github_username"],
      location: params["location"],
      bio: params["bio"],
      layout_choice: params["layout_choice"],
      user_id: current_user.id
    )
    if @profile.save
      render "create.json.jbuilder", status: :created
    else
      render json: { errors: @profile.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @user    = User.find_by(username: params["id"])
    @profile = Profile.find_by(user_id: @user.id)
    render "show.json.jbuilder"
  end

  def edit

  end

end
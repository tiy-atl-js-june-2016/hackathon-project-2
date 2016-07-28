class ProfilesController < ApplicationController

  before_action :authenticate!, only: [:create, :edit]

  def create
    @profile = Profile.create(
      github_username: params["github_username"],
      location: params["location"],
      bio: params["bio"],
      layout_choice: params["layout_choice"],
      user_id: current_user.id
    )

    render "show.json.jbuilder"
  end

  def index
    @bill = Bill.find_by(user_id: params["user_id"])
    render "show.json.jbuilder"
  end

  def edit

  end

end
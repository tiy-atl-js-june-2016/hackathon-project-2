class GithubController < ApplicationController

  before_action :github_connect

  def github_connect
    @github = Github.new login:ENV['GITHUB_USERNAME'], password: ENV['GITHUB_TOKEN']
  end

  def index

    # Get user by username
    user = User.find_by(username: params['username'])
    if (user)
      # Get profile by user name then make sure user actually has created a profile
      profile = Profile.find_by(user_id: user.id)
      if (profile && profile.github_username)
        @user = @github.users.get user: profile.github_username
        @repos = @github.repos.list user: profile.github_username
        @orgs = @github.orgs.list user: profile.github_username
        render "index.json.jbuilder"
      else
        render json: { error: 'User is either missing a profile or their github username is empty' }, status: :unprocessable_entity
      end
    else 
      render json: { error: "No user with username `#{params['username']}`" }, status: :unprocessable_entity
    end

  end

end
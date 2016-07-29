class GithubController < ApplicationController

  before_filter :github_connect

  def github_connect
    @github = Github.new login:ENV['GITHUB_USERNAME'], password: ENV['GITHUB_TOKEN']
  end

  def index

    user = User.find_by(username: params['username'])
    profile = Profile.find_by(user_id: user.id)

    @user = @github.users.get user: profile.github_username
    @repos = @github.repos.list user: profile.github_username
    @orgs = @github.orgs.list user: profile.github_username

    render "index.json.jbuilder"
  end

end
class RepositoriesController < ApplicationController

  def index
  end

  def show
    @profile = Profile.find_by_username(params[:username]) ||
        Profile.create_from_username(params[:username])

    # @profile = Profile.new(params[:username])
    # if @profile.username.blank?
    #   redirect_to root_path
    # else
    #   if Profile.where(username: @username).blank?
    #     @repositories = RepositoryList.new(params[:username]).repositories
    #   else
    #
    #   end
    # end
  end

end

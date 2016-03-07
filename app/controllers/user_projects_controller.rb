class UserProjectsController < ApplicationController
    def index
        @user = User.find(params[:id])
        @project = @user.projects
    end
    
end

class StaticPagesController < ApplicationController
  def home
  end

  def users
    @users = User.all
  end
  
  def help
  end
end

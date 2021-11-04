class UsersController < ApplicationController
 def show 
  @user = User.new
  @user = @user.comments.includes(:user)
 end
end

class UsersController < ApplicationController
 def show 
  @prototype = Prototype.new
  @prototype = Prototype.find(params[:id])
  @user = User.new
  @user = @user.comments.includes(:user)
  @user = @prototype.comments.includes(:user)
 end
end

class UsersController < ApplicationController
 def show 
  #user = User.find(params[:id])
  #@user = current_user.prototypes
  #@prototypes = current_user.prototypes

  @user = User.find(params[:id])
  @prototypes = @user.prototypes
 end
end

class PrototypesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :move_to_index, only: :edit

  def new
    @prototype = Prototype.new
  end
  def create
    #@comment = comment.new(comment_params)
    @prototype = Prototype.new(prototypes_params)
    if @prototype.save
        redirect_to root_path
      else
        render :new
      end
    end
     
def index 
  @prototype = Prototype.all
 end
 
def show
  @prototype = Prototype.new
  @prototype = Prototype.find(params[:id])
  @comment = Comment.new
  @comments = @prototype.comments.includes(:user)
end
def edit
  @prototype = Prototype.find(params[:id])
end

def update
  @prototype = Prototype.find(params[:id])
  if @prototype.update(prototypes_params)
    redirect_to prototype_path(@prototype.id)
  else
    render :edit
  end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end  

  private
  def prototypes_params
    params.require(:prototype).permit(:concept, :catch_copy, :image, :title).merge(user_id: current_user.id)
  end
  def move_to_index
    @prototype = Prototype.find(params[:id]) 
  unless user_signed_in? && current_user.id == @prototype.user_id
    redirect_to action: :index
   end
  end
end

 
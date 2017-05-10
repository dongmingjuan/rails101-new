class PostsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy, :join, :quit]
  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
      current_user.join!(@group)
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
      @group = Group.find(params[:group_id])
      @post = Post.find(params[:id])
  end

  def update
      @group = Group.find(params[:group_id])
      @post = Post.find(params[:id])

      if @post.update(post_params)
        redirect_to group_path(@group)
      else
        render :edit
      end

  end

  private

  def post_params
    params.require(:post).permit(:content, :attachment)
  end

end

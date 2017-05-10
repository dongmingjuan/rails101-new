class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  layout 'admin'

  def index
    @group = Group.find(params[:group_id])
    @posts = @group.posts.order('created_at DESC')
  end
end

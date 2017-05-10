class Admin::GroupsController < ApplicationController
    before_action :authenticate_user! , only: [:new, :create, :edit, :update, :destroy]
    before_action :require_is_admin
    def index
     @groups = Group.all
    end

    def new
      @group = Group.new
    end

    def create
      @group = Group.new(group_params)

      if @group.save
       redirect_to admin_groups_path
     else
       render :new
     end
    end

    def show
      @group = Group.find(params[:id])
    end

    def edit
      @group = Group.find(params[:id])
    end

    def update
      @group = Group.find(params[:id])
      if @group.update(group_params)
        redirect_to admin_groups_path
      else
        render :edit
      end
    end

    def destroy
      @group.destroy
      redirect_to admin_groups_path
    end

    private
    def group_params
      params.require(:group).permit(:title, :description, :is_hidden)
    end


end

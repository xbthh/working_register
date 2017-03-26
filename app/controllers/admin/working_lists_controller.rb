class Admin::WorkingListsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin

  layout "admin"

  def show
    @working_list = WorkingList.find(params[:id])
  end

  def index
    @working_lists = WorkingList.all
  end

  def new
    @working_list = WorkingList.new
  end

  def create
    @working_list = WorkingList.new(WorkingList_params)

    if @working_list.save
      redirect_to admin_WorkingLists_path
    else
      render :new
    end
  end

  def edit
    @working_list = WorkingList.find(params[:id])
  end

  def update
    @working_list = WorkingList.find(params[:id])
    if @working_list.update(WorkingList_params)
      redirect_to admin_WorkingLists_path
    else
      render :edit
    end
  end

  def destroy
    @working_list = WorkingList.find(params[:id])

    @working_list.destroy

    redirect_to admin_WorkingLists_path
  end

  private

  def WorkingList_params
    params.require( :working_list).permit(:category_name,:date, :department, :colleague, :title, :is_plan, :take_time, :descrption, :progress)
  end
end

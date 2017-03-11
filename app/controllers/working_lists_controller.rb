class WorkingListsController < ApplicationController
  def index
    @working_lists = WorkingList.all
  end

  def new
    @working_list = WorkingList.new
  end

  def show
    @working_list = WorkingList.find(params[:id])
  end

  def edit
    @working_list = WorkingList.find(params[:id])
  end

  def update
    @working_list = WorkingList.find(params[:id])

    if @working_list.update(working_list_params)
      redirect_to working_lists_path, notice: "Update Success"
    else
      render :edit
    end
  end

  def destroy
    @working_list = WorkingList.find(params[:id])

    @working_list.destroy
    flash[:alert] = "WorkingList deleted"
    redirect_to working_lists_path
  end

  def create
    @working_list = WorkingList.new(group_params)

    if @working_list.save
      redirect_to working_lists_path
    else
      render :new
    end
  end
  
  private

  def working_list_params
    params.require( :working_list).permit(:date, :department, :colleague, :title, :is_plan, :take_time, :descrption, :progress)
  end

end

class WorkingListsController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create, :edit, :destroy]

  def index
    @working_lists = case params[:working_list]
    when 'by_date'
      WorkingList.current_working_list(current_user).desc_date
    when 'by_take_time'
      WorkingList.current_working_list(current_user).desc_take_time
    else
      WorkingList.current_working_list(current_user).recent
    end

    @today = Date.today
    @wl = @working_lists.where("date >= ? AND date <= ?",
                              @today.beginning_of_week,
                              @today.end_of_week)

    @wa = @wl.group(:category_name).sum(:take_time)
    @ws = @wl.sum(:take_time)

    @a = Array.new()

    @wa.values.each do |i|
      @a << i / @ws
    end

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
    @working_list = WorkingList.new(working_list_params)
    @working_list.user = current_user

    if @working_list.save
      redirect_to working_lists_path
    else
      render :new
    end
  end

  private

  def find_workinglist_and_check_permission
    @working_list = WorkingList.find(params[:id])

    if current_user != @working_list.user
      redirect_to root_path, alert: "You have no permission."
    end
  end


  def working_list_params
    params.require( :working_list).permit(:category_name,:date, :department, :colleague, :title, :is_plan, :take_time, :descrption, :progress)
  end

end

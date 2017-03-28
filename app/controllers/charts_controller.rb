class ChartsController < ApplicationController

  def index
    @working_lists = WorkingList.current_working_list(current_user)

    if params[:beg_date].present? && params[:end_date].present?
      @beg_date = Date.parse(params[:beg_date])
      @end_date = Date.parse(params[:end_date])

      @wl = @working_lists.where("date >= ? AND date <= ?",@beg_date.beginning_of_day,@end_date.end_of_day)

      @wa = @wl.group(:category_name).sum(:take_time)
      @ws = @wl.sum(:take_time)

      @a = Array.new()

      @wa.values.each do |i|
        @a << i / @ws
      end

    else
      @today = Date.parse("2017-03-17")
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
  end

end

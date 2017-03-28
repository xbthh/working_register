class ChartsController < ApplicationController

  def index
    @working_lists = WorkingList.current_working_list(current_user)
  end

end

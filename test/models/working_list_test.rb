# == Schema Information
#
# Table name: working_lists
#
#  id         :integer          not null, primary key
#  date       :date
#  department :string
#  colleague  :string
#  title      :string
#  is_plan    :boolean          default("t")
#  take_time  :float
#  descrption :text
#  progress   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class WorkingListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

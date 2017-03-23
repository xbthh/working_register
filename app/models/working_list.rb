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

class WorkingList < ApplicationRecord

  belongs_to :user
  has_many :categories

  scope :recent, -> { order('created_at DESC') }
  scope :desc_date, -> { order('date DESC') }
  scope :desc_take_time, -> { order('take_time DESC') }

  scope :current_working_list, ->(current_user) { where("user_id = ?",current_user) }

end

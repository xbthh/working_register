class Category < ApplicationRecord
  has_many :working_lists
  belongs_to :user
end

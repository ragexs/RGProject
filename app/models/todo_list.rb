class TodoList < ActiveRecord::Base
  attr_accessible :content, :user_id
  belongs_to :user
  validates_presence_of :user_id, :content
  has_many :task
end

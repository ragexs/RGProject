class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password
  before_save :create_remember_token
  validates_uniqueness_of :name
  validates_presence_of :name, :password, :password_confirmation
  has_many :todo_lists, dependent: :destroy

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end

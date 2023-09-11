class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :flats, dependent: :destroy
  has_one_attached :photo, dependent: :destroy

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, if: :new_record?

  def vip?
    role == "vip"
  end

  def admin?
    role == "admin"
  end

  def user?
    role == "user"
  end

  private
  def set_default_role
    self.role ||= :user
  end
end

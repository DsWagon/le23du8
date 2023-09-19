class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Email invalid" }
  validates :first_name, presence: true, length: { minimum: 3}
  validates :last_name, presence: true, length: { minimum: 3}


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

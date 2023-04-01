class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: false
  validates :nickname, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  has_many :menus
  has_many :likes
end
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :contact_number, presence: true
  validates :role_id, presence: true
  belongs_to :role
end

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include ImageUploader::Attachment(:image)
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :contact_number, presence: true
  validates :role_id, presence: true
  belongs_to :role
end

class User < ApplicationRecord
  belongs_to :family, optional: true
  has_many :pets, through: :family
  has_many :schedules
  has_many :notifications, dependent: :destroy
  has_many :tasks, through: :schedule
  has_one_attached :photo

  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

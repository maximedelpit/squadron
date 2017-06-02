class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_skills, dependent: :destroy
  has_many :skills, through: :user_skills

  accepts_nested_attributes_for :user_skills, :allow_destroy => true
end

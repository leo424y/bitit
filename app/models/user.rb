class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :groups
  has_many :posts

  has_many :group_users
  has_many :participated_groups, through: :group_users, source: :group

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

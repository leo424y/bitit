gclass User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :groups
  has_many :posts
  has_many :askwords

  has_many :group_users
  has_many :participated_groups, through: :group_users, source: :group

  has_many :askword_users
  has_many :participated_askwords, through: :askword_users, source: :askword

  def join!(group)
    participated_groups << group
  end

  def quit!(group)
    participated_groups.delete(group)
  end

  def is_member_of?(group)
    participated_groups.include?(group)
  end

  def is_member_of?(askword)
    participated_askwords.include?(askword)
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

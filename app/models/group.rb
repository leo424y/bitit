class Group < ActiveRecord::Base
  scope :recent, -> { order("updated_at DESC") }
  scope :posts_count_D, -> { order("posts_count DESC") }

  validates :title, presence: true, length: { maximum: 20 }

  has_many :posts, dependent: :destroy
  has_many :group_users
  has_many :members, through: :group_users, source: :user

  belongs_to :owner, class_name: "User", foreign_key: :user_id

  def editable_by?(user)
    user && user == owner
  end
end

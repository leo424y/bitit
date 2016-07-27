class Askword < ActiveRecord::Base
  scope :recent, -> { order("updated_at DESC") }

  validates :title, presence: true, length: { maximum: 20 }

  has_many :askword_users
  has_many :members, through: :askword_users, source: :user

  belongs_to :owner, class_name: "User", foreign_key: :user_id

  def editable_by?(user)
    user && user == owner
  end

end

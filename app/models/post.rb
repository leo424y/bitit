class Post < ActiveRecord::Base
  validates :content, presence: true
  validates_length_of :content, :maximum => 20
  belongs_to :group, counter_cache: :posts_count
  belongs_to :author, class_name: "User", foreign_key: :user_id

  def editable_by?(user)
    user && user == author
  end
end

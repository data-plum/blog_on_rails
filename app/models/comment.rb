class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :user_id, :post_id, presence: true
  validates :content, presence: true
end

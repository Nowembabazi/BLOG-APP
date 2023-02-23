class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true

  after_save :update_posts_counter

  def update_posts_counter
    post.increment!(:comments_counter)
  end
end

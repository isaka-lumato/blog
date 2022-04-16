class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  after_save :post_counter

  def five_recent_comments
    Comment.limit(5).order(created_at: :desc)
  end

  private

  def post_counter
    author.increment!(:posts_counter)
  end
end

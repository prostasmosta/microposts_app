class Micropost < ApplicationRecord
  belongs_to :user
  has_one_attached :picture

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

  default_scope -> { order(created_at: :desc) }

  def pic_thumb
    return unless picture.content_type.in?(%w[image/jpg image/jpeg image/png image/gif])
    picture.variant(resize_to_limit: [300,300]).processed
  end
end

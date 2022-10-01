class Post < ApplicationRecord

  belongs_to :user
  has_one :category_medium
  has_one :category_motif
  has_one :category_style
  has_many :bookmarks, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_one_attached :image
  has_one_attached :image_sub1
  has_one_attached :image_sub2

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no_image.jpeg")
      image.attach(io: File.open(file_path), filename: "no_image.jpeg", content_type: "image/jpeg")
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def get_image_sub1(width, height)
    image_sub1.variant(resize_to_limit: [width, height]).processed
  end

  def get_image_sub2(width, height)
    image_sub2.variant(resize_to_limit: [width, height]).processed
  end

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
  
  validates :category_medium_id, presence: true
  validates :category_motif_id, presence: true
  validates :category_style_id, presence: true
  validates :title, presence: true
  validates :introduction, length: {minimum: 1, maximum: 240}
  validates :image, presence: true

end

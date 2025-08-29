class Board < ApplicationRecord
  has_one_attached :main_image
  has_many :discussion_threads

  validate :image_type

  private

  def image_type
    if main_image.attached? && !main_image.content_type.in?(%w(image/jpeg image/png image/webp))
      errors.add(:image, "must be a JPEG, PNG, or WebP")
    end
  end
end

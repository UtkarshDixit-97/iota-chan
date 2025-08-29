class DiscussionThread < ApplicationRecord
  has_many_attached :media
  belongs_to :board
  belongs_to :board
  has_many :comments, dependent: :destroy
end

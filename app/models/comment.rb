class Comment < ApplicationRecord
  belongs_to :discussion_thread
  validates :content, presence: true
end

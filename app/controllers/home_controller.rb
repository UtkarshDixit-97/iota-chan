class HomeController < ApplicationController
  def index
    @boards = Board.all
    @discussion_threads = DiscussionThread.order(created_at: :desc).limit(10)
  end

  def about
  end

  def rules
  end
end

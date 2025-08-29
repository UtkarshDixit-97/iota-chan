class CommentsController < ApplicationController
  before_action :set_discussion_thread

  def create
    @comment = @discussion_thread.comments.build(comment_params)

    if @comment.save
      redirect_to @discussion_thread, notice: 'Comment was successfully created.'
    else
      redirect_to @discussion_thread, alert: 'Error creating comment.'
    end
  end

  private

  def set_discussion_thread
    @discussion_thread = DiscussionThread.find(params[:discussion_thread_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

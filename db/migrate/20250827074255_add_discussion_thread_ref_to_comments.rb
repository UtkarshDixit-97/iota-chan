class AddDiscussionThreadRefToComments < ActiveRecord::Migration[8.0]
  def change
    add_reference :comments, :discussion_thread, null: false, foreign_key: true
  end
end

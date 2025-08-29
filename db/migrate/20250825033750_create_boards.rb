class CreateBoards < ActiveRecord::Migration[8.0]
  def change
    create_table :boards do |t|
      t.string :name
      t.boolean :is_nsfw

      t.timestamps
    end
  end
end

class AddOrderIdToUserStories < ActiveRecord::Migration[5.1]
  def change
    add_column :user_stories, :order_id, :integer
  end
end

class RemoveFollowingIdFromFollow < ActiveRecord::Migration[5.2]
  def change
    remove_column :follows, :following_id, :integer
  end
end

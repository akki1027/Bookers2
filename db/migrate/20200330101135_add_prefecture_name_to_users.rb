class AddPrefectureNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :prefecture_name, :string
  end
end

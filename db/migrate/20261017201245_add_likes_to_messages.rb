class AddLikesToMessages < ActiveRecord::Migration[8.1]
  def change
    add_column :messages, :likes, :integer, default: 0, null: false
  end
end

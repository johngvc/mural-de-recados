class AddColorToMessages < ActiveRecord::Migration[8.1]
  def change
    add_column :messages, :color, :string, default: "yellow", null: false
  end
end

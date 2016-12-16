class AddPathToLinks < ActiveRecord::Migration[5.0]
  def change
    add_column :links, :path, :string
  end
end

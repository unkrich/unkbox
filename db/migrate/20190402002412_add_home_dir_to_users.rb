class AddHomeDirToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :home_dir, :integer
  end
end

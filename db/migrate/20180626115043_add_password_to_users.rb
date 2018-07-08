class AddPasswordToUsers < ActiveRecord::Migration[5.1]
  def up
    add_column :users, :password_digest, :string
  end

  def down
    remove_column :users, :password_digest, :string
  end
end

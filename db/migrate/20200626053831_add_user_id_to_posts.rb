class AddUserIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_culumn :posts, :user_id, :integer
  end
end

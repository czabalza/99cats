class AddPictureToUser < ActiveRecord::Migration
  def change
    add_column :cats, :picture, :string
    add_column :users, :picture, :string
  end
end

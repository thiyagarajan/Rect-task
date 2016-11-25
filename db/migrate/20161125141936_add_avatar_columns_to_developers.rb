class AddAvatarColumnsToDevelopers < ActiveRecord::Migration
  def up
    add_attachment :developers, :avatar
  end

  def down
    remove_attachment :developers, :avatar
  end
end

class AddBadgeToSkills < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :badg, :text
  end
end

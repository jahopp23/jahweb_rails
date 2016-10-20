class AddLinkToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :link, :string
  end
end

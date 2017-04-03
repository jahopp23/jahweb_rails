class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.text :body

      t.timestamps
    end
  end
end

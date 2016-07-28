class CreateProfile < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :github_username
      t.string :location
      t.text :bio
      t.integer :layout_choice
    end
  end
end

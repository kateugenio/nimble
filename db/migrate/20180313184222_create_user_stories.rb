class CreateUserStories < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stories do |t|
      t.string :title
      t.string :description
      t.text :acceptance_criteria
      t.integer :estimate
      t.string :state
      t.string :priority
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end

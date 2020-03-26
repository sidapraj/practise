class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :good_answers_count, default: 0 
      t.integer :bad_answers_count, default: 0

      t.timestamps null: false
    end
  end
end

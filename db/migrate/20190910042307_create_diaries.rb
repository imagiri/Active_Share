class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.text :content
      t.string :title
      t.datetime :activity_date

      t.references :user, foreign_key:

      t.timestamps
    end
  end
end

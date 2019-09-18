class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :main_image
      t.string :sub_image
      t.text :memo
      t.references :diary, foreign_key: true

      t.timestamps
    end
  end
end

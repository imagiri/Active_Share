class AddColumnDiary < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :main_image, :string
    add_column :diaries, :sub_image, :json
  end
end

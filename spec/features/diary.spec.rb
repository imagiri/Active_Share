require 'rails_helper'

RSpec.feature "活動日記管理機能", type: :feature do
  # scenario（itのalias）の中に、確認したい各項目のテストの処理を書きます。

  background do
    FactoryBot.create(:user)
    FactoryBot.create(:diary)
    FactoryBot.create(:second_diary)
  end

  scenario "活動日記作成のテスト" do
    visit new_diary_path
    fill_in "タイトル", with: 'rspec_test'
    fill_in "活動日時", with: '2019,10,26'
    fill_in "内容", with: 'rspec_test'
    click_on '投稿する'
  end

  scenario "活動日記一覧のテスト" do
    visit diaries_path
    save_and_open_page

  end

  scenario "活動日記詳細のテスト" do

  end
end

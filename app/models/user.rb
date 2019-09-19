class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :icon, ImageUploader
  mount_uploader :back_icon, ImageUploader



  has_many :diaries
  has_many :comments, dependent: :destroy
  has_many :active_relationships, foreign_key: 'follower_id', class_name: 'Relationship', dependent: :destroy
  has_many :passive_relationships, foreign_key: 'followed_id', class_name: 'Relationship', dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :favorites, dependent: :destroy
  has_many :favorite_diaries, through: :favorites, source: :diary



  enum sex: { 男: 1, 女: 2}

  enum age: {
        "10代": 1,"20代": 2,"30代": 3,
        "40代": 4,"50代": 5,"60代以上": 6}

  enum outdoor_history: {
        "未経験": 1,"１年未満": 2,"１年以上３年未満": 3,
        "５年未満": 4,"５年以上": 5
        }

  enum birth_place: {
        北海道:1,青森県:2,岩手県:3,宮城県:4,秋田県:5,山形県:6,福島県:7,
        茨城県:8,栃木県:9,群馬県:10,埼玉県:11,千葉県:12,東京都:13,神奈川県:14,
        新潟県:15,富山県:16,石川県:17,福井県:18,山梨県:19,長野県:20,
        岐阜県:21,静岡県:22,愛知県:23,三重県:24,
        滋賀県:25,京都府:26,大阪府:27,兵庫県:28,奈良県:29,和歌山県:30,
        鳥取県:31,島根県:32,岡山県:33,広島県:34,山口県:35,
        徳島県:36,香川県:37,愛媛県:38,高知県:39,
        福岡県:40,佐賀県:41,長崎県:42,熊本県:43,大分県:44,宮崎県:45,鹿児島県:46,沖縄県:47
      },_prefix: true

  enum activity_area: {
        未選択:1,北海道:2,東北:3,関東:4,中部:5,近畿:6,中国:7,四国:8,九州:9
      },_prefix: true

end

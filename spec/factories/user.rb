FactoryBot.define do

  factory :user, class: User  do
    id {1}
    name { 'test' }
    email { 'test@test.com' }
    password {"sumabura"}
    password_confirmation {"sumabura"}

  end
  factory :user_2, class:User do
    id {2}
    name {"sample2"}
    email {"sample2@exsample.com"}
    password {"password"}
    password_confirmation {"password"}
  end

  factory :user_3, class:User do
    id {3}
    name {"sample3"}
    email {"sample3@exsample.com"}
    password {"password"}
    password_confirmation {"password"}
  end
end

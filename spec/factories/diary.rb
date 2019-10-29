FactoryBot.define do

factory :diary, class: Diary  do
  title { 'test_task_01' }
  content { 'testtesttest' }
  activity_date {'2019/10/26'}
  user_id {1}
end

factory :second_diary, class: Diary do
  title { 'test_task_02' }
  content { 'testtesttest' }
  activity_date {'2019/10/26'}
  user_id {1}
end
end

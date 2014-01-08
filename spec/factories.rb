FactoryGirl.define do
  factory :user do
    name      "Maciej Kocyła"
    email     "maciej.kocyla@gmail.com"
    password  "foobar"
    password_confirmation "foobar"
  end
end

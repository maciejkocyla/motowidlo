FactoryGirl.define do
  factory :user do
    name      "Maciej Kocyła"
    email     "maciej.kocyla@gmail.com"
    password  "foobar"
    password_confirmation "foobar"
  end

  factory :category do
    name      "Sample Category"
  end
end

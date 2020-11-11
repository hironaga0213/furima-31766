FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {Faker::Name.initials(number: 2)}
    family_name           {Faker::Name.initials(number: 2)}
    read_first            {person.first.katakana}
    read_family           {person.last.katakana}
    birth                 {Faker::Date.backward}    
  end
end



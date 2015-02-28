FactoryGirl.define do
  factory :user do
    first_name "Jane"
    last_name "Smith"
    github "smith123"
    email "test@test.com"
    password  "password"
    password_confirmation "password"
    admin_status true
  end
  factory :assignment do
    name "Hello World"
    requirements "assignment requirements"
  end
  factory :course do 
    name 'Rails'
    description 'the course is cool'
    end
  factory :location do 
    name 'Charleston'
    address '510 Mill St.'
    end
  factory :submission do 
    name 'homework'
    content 'homework content'
    end
  
end
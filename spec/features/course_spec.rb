require 'rails_helper'
describe "add course", type: :feature, js: true do
  it 'should allow user to add a course' do
    visit root_path
    click_link "Login"
    fill_in 'Email', with: "jo@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'
    expect(page).not_to have_content("Login")
    expect(page).not_to have_content("Register")
    visit root_path
    click_link 'Course List'
    click_link 'Add a New Course'
    fill_in 'Name', with: "sample course"
    fill_in 'Description', with: "some description"
    click_button 'Submit'
    expect(page).to have_content("sample course information successsfully saved.")
  end
  
end
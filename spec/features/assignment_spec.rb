require 'rails_helper'

describe "add an assignment", type: :feature, js: true do
  let!(:assignment) {
    FactoryGirl.create(:assignment)
  }
# create an assignment object
  let!(:user) {
    FactoryGirl.create(:user)
  }  
# create a user
  it 'should allow user to add an assignment' do
    visit root_path
    click_link "Login"
    fill_in 'Email', with: "test@test.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'
    expect(page).not_to have_content("Login")
    expect(page).not_to have_content("Register")
    visit root_path
    click_link 'Assignments'
    click_link 'Add an Assignment'
    fill_in 'Name', with: "sample assignment"
    fill_in 'Requirements', with: "some content"
    click_button 'Submit'
    expect(page).to have_content("sample assignment information successsfully saved.")
    
  end
 
end
require 'rails_helper'

describe "add a submission to an assignment", type: :feature, js: true do
  let!(:assignment) {
    FactoryGirl.create(:assignment)
  }
# create an assignment object
  let!(:user) {
    FactoryGirl.create(:user)
  }  
# create a user
  it 'should allow user to login' do
    visit root_path
    click_link "Login"
    fill_in 'Email', with: "test@test.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'
    expect(page).not_to have_content("Login")
    expect(page).not_to have_content("Register")
  
    click_link 'Assignments'
    click_link 'Add an Assignment'
    fill_in 'Name', with: "sample assignment"
    fill_in 'Requirements', with: "some content"
    click_button 'Submit'
    expect(page).to have_content("sample assignment information successsfully saved.")

    click_link 'sample assignment'
    click_link 'Submit an Assignment' 
    click_link 'Add a submission'
    fill_in 'Name', with: "submission test"
    fill_in 'Content', with: "some content"
    click_button 'Submit'
    expect(page).to have_content("Submission was successfully saved")
    expect(page).to have_content("Edit submisssion")
    expect(page).to have_content("Delete submisssion")
    save_and_open_page
  end
end
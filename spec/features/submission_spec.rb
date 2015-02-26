require 'rails_helper'

describe "add submission to an assignment", type: :feature, js: true do
  let!(:assignment) {
    FactoryGirl.create(:assignment)
  }
  # let!(:user) {
  #   FactoryGirl.create(:user)
  # }  
  it 'should allow user to add a submission' do
    visit root_path
    Assignment.create!({
        name: "Hello"
    })
    p Assignment.all
    click_link 'Register'
    fill_in "First name", with: "Jo"
    fill_in "Last name", with: "Johnson"
    fill_in "Github", with: "johson"
    fill_in "Email", with: "j@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    visit root_path
    # click_link "Login"
    # fill_in 'Email', with: "test@test.com"
    # fill_in 'Password', with: "password"
    # click_button 'Log in'
    # expect(page).not_to have_content("Login")
    # expect(page).not_to have_content("Register")
    # visit root_path
    click_link 'Assignments'
    p Assignment.all
    save_and_open_page
    expect(first("link")).to be_visible    
# ask for more validation examples - can't add assignments even when logged in as admin
# fails bc it can't find my assignment links?
    
    # click_link ''
    # click_link 'Submit an Assignment'
    # click_link 'Add a submission'
    # fill_in 'Name', with: "sample submission"
    # fill_in 'Content', with: "some content"
    # click_button 'Submit'
    # expect(page).to have_content("Submission was successsfully saved.")
  end

  
  
end
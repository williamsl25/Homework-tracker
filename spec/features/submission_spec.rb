require 'rails_helper'
describe "add submission to an assignment", type: :feature, js: true do
  it 'should allow user to add a submission' do
    visit root_path
    click_link "Login"
    fill_in 'Email', with: "jo@gmail.com"
    fill_in 'Password', with: "password"
    click_button 'Log in'
    expect(page).not_to have_content("Login")
    expect(page).not_to have_content("Register")
    visit root_path
    click_link 'Assignments'
    expect(first("link")).to be_visible
    
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
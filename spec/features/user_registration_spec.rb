require 'rails_helper'
#1
describe "user registration", type: :feature, js: true do
  it "should allow user to register" do
    visit root_path
    click_link 'Register'
    fill_in "First name", with: "Jo"
    fill_in "Last name", with: "Johnson"
    fill_in "Github", with: "johson"
    fill_in "Email", with: "jo@gmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Logout: jo@gmail.com")
    save_and_open_page
  end
  it 'should sign in successfully' do
    visit root_path
    click_link "Login"
    fill_in 'Email', with: "jo@gmail.com"
    fill_in 'Password', with: "password"
    click_button "Log in"
    expect(page).to have_content("Signed in successfully.")
    expect(page).not_to have_content("Login")
    expect(page).not_to have_content("Register")
  end
  it 'should not sign in successfully' do
    visit root_path
    click_link "Login"
    fill_in 'Email', with: "jo@gmail.com"
    click_button "Log in"
    expect(page).to have_content("Invalid email or password.")
  end
  it "should not allow user to register" do
    visit root_path
    click_link 'Register'
    click_button "Sign up"
    expect(page).not_to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("2 errors prohibited this user from being saved:")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
    # save_and_open_page
  end
  
  
end
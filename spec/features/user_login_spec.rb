require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  
  before :each do
    @user = User.create!(name: "Jethro Tull", email: "jethro@tull.com", password: "jethro")
  end

  scenario "User can login" do
    
    visit root_path
    click_link('Login')
    fill_in 'email', with: 'jethro@tull.com'
    fill_in 'password', with: 'jethro'
    click_button('Submit')

    # DEBUG
    sleep(1)
    save_screenshot

    # VERIFY
    expect(page).to have_text("Signed in as Jethro Tull")
  end
end

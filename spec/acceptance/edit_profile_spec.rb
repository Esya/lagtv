require 'acceptance/acceptance_helper'

feature 'My Profile page' do
  background do
    user = Fabricate(:member, :name => 'Bouse')

    login_as(user)

    click_link('Bouse')
  end

  scenario 'save button message appears' do
    page.should have_css '.btn', :value => 'Save changes'
  end

  scenario 'users cannot change their own active state' do
    page.should_not have_css 'input#user_active'
  end

  scenario 'users can change their own password' do
    page.should have_css 'input#user_password'
  end

  scenario 'users can edit their own username' do
    fill_in 'Username', :with => 'Bouse2'
    click_button 'Save Changes'

    page.should have_content 'Your profile as been updated'
  end
end
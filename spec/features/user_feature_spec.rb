require 'features_helper'

describe 'seeing users' do
  let!(:user) { create(:user) }

  it 'displays the user page', js: true do
    visit users_path

    expect(page).to have_content user.full_name
    expect(page).to have_content 'Users'
  end

  it 'displays a user page' do
    visit user_path(user.id)

    expect(page).to have_content user.full_name
  end
end

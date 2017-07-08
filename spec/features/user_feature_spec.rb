require 'features_helper'

describe 'seeing users' do
  let!(:user) { create(:user) }

  it 'displays the user page' do
    visit(users_path)

    expect(page).to have_content 'Princess Bubblegum'
  end
end

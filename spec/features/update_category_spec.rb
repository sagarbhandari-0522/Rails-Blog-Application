require 'rails_helper'

RSpec.feature 'UpdateCategories', type: :feature do
  scenario 'valid inputs' do
    spt = create(:category)
    visit edit_category_path(id: spt.id)
    fill_in 'Name', with: 'Sports'
    click_on 'Update Category'
    visit categories_path
    expect(page).to have_content('Sports')
  end
end

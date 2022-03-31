require 'rails_helper'

RSpec.feature 'CreateCategories', type: :feature do
  scenario 'valid inputs' do
    visit new_category_path
    fill_in 'Name', with: 'Sagarss'
    click_on 'Create Category'
    visit categories_path
    expect(page).to have_content('Sagarss')
  end
  scenario 'invalid inputs' do
    visit new_category_path
    fill_in 'Name', with: nil
    click_on 'Create Category'
    visit categories_path
    expect(page).to have_content('categorys Created Unsuccessfull')
  end
end

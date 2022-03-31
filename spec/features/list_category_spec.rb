require 'rails_helper'

RSpec.feature 'ListCategories', type: :feature do
  scenario 'success' do
    category = create(:category)
    id = category.id
    visit categories_path
    expect(page).to have_link(category.name.titlecase.to_s, href: "/categories/#{id}")
  end
end

require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'name presence' do
    category = FactoryBot.build(:category)
    expect(category).to be_valid
    category = FactoryBot.build(:category, name: nil)
    expect(category).to_not be_valid
  end

  it 'name uniqueness' do
    category = FactoryBot.create(:category)
    expect(category).to be_valid
    category = FactoryBot.build(:category)
    expect(category).to_not be_valid
  end
  it 'name length' do
    category = FactoryBot.build(:category)
    expect(category).to be_valid
    category = FactoryBot.build(:category, name: 'sagar')
    expect(category).to_not be_valid
    category = FactoryBot.build(:category, name: 'a' * 50)
    expect(category).to_not be_valid
  end
end

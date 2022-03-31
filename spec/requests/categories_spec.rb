require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  describe 'GET /index' do
    it 'should get the categories' do
      get categories_path
      expect(response).to have_http_status(200)
    end
    it 'should render index page' do
      get categories_path
      expect(response).to render_template('index')
    end
  end
  describe 'POST /create' do
    it 'should create category' do
      category = attributes_for(:category)
      post '/categories', params: { category: category }
      expect(response).to have_http_status(302)
    end
    it 'should not create category without name' do
      category = attributes_for(:category, name: nil)
      post '/categories', params: { category: category }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
  describe 'GET/show' do
    it 'should show a category based on a category id' do
      category = FactoryBot.create(:category)
      get category_path(category.id)
      expect(response).to have_http_status(200)
    end
    it 'should not show category for false id' do
      get category_path(id: 1000)
      expect(response).to have_http_status(422)
    end
  end
  describe 'Delete/destroy' do
    it 'should delete category of provided id' do
      category = Category.first
      delete "/categories/#{category.id}"
      expect(response).to have_http_status(:see_other)
    end
  end
end

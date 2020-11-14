require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'articles association' do

    before do
      @user = FactoryBot.build(:user)
      @user.save

      @article = FactoryBot.build(:article, author: @user)
      Category.create(name: 'fashion', priority: 1)
      Category.create(name: 'business', priority: 2)
      @article.categories << [ Category.find_by(priority: 1), Category.find_by(priority: 2) ]
      @article.save 
    end

    context 'deleting a category' do

      it 'should destroy the category' do
        Category.find_by(priority: 2).destroy
        expect(Category.find_by(priority: 2)).to be_nil
        expect(Category.find_by(priority: 1)).to_not be_nil
      end

      it 'should destroy the category' do
        Category.destroy_all
        expect(Category.all).to be_empty
      end

      it 'should not destroy any associated articles' do
        Category.find_by(priority: 2).destroy
        expect(Category.find_by(priority: 1).articles).to_not be_empty
      end

      it 'should not destroy any associated articles' do
        Category.destroy_all 
        expect(Article.all).to_not be_empty
      end
    end
  end
end

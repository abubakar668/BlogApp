require 'rails_helper'

RSpec.describe Post, type: :model do
  # Testing validations
  describe 'validations' do
    it 'is valid with valid attributes' do
      user = User.create(email: 'test@example.com', password: 'password123', password_confirmation: 'password123')
      post = user.posts.build(title: 'My first post', content: 'Hello, world!')
      expect(post).to be_valid
    end

    it 'is not valid without a title' do
      post = Post.new(title: nil, content: 'No title here')
      expect(post).not_to be_valid
    end

    it 'is not valid without content' do
      post = Post.new(title: 'Missing content', content: nil)
      expect(post).not_to be_valid
    end
  end

  # Testing associations
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:likes).dependent(:destroy) }
  end
end

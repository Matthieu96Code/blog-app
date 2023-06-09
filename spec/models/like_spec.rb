require 'rails_helper'

RSpec.describe Like, type: :model do
  let!(:user) { User.create(name: 'Matthieu', bio: 'Computer scientist', posts_counter: 0) }
  let!(:post) do
    Post.create(author: user, title: 'mindsest', text: 'Adopt a growing mindset', likes_counter: 0,
                comments_counter: 0)
  end
  subject { described_class.create(post:, author: user) }

  describe 'for associations' do
    it 'should belong to correct user' do
      expect(subject.author).to eql user
    end

    it 'should belong to correct post' do
      expect(subject.post).to eql post
    end

    it 'should update counter of related post' do
      expect(subject.post.likes_counter).to eql 1
    end
  end
end

require 'rails_helper'

RSpec.describe Post, type: :model do
  user = User.new(name: 'Anything',
                  photo: 'http://licalhost:3000/anything.jpg',
                  bio: 'Anything test',
                  posts_counter: 0)
  subject do
    described_class.new(
      title: 'Anything',
      text: 'Anything test',
      author: user,
      comments_counter: 0,
      likes_counter: 0
    )
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without a title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid with a length for title  more than 250 ' do
    title = ''
    title += 'a' while title.length < 251
    subject.title = title
    expect(subject).to_not be_valid
  end
  it 'it is not valid with negeative number for comment conuter' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end
  it 'it is not valid with string for comment conuter' do
    subject.comments_counter = 'string'
    expect(subject).to_not be_valid
  end
  it 'it is not valid with negeative number for like conuter' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
  it 'it is not valid with string for post conuter' do
    subject.likes_counter = 'string'
    expect(subject).to_not be_valid
  end
  describe '#five_most_recent_comments, counter private methods' do
    let(:user1) { User.new(name: 'Jane') }
    let(:post) { Post.new(author: user1, text: '1', title: '1') }
    let!(:comment1) { Comment.new(author: user1, post:, text: '1') }
    let!(:comment2) { Comment.new(author: user1, post:, text: '2') }
    let!(:comment3) { Comment.new(author: user1, post:, text: '3') }
    let!(:comment4) { Comment.new(author: user1, post:, text: '4') }
    let!(:comment5) { Comment.new(author: user1, post:, text: '5') }
    let!(:comment6) { Comment.new(author: user1, post:, text: '6') }
    before do
      post.comments = [comment1, comment2, comment3, comment4, comment5]
      post.save
    end
    it 'returns the five most recent comments' do
      expect(post.five_most_recent_comments).to eq([comment5, comment4, comment3, comment2, comment1])
    end
    it 'it should update user posts_counter' do
      expect(user1.posts_counter).to eq(1)
    end
  end
end

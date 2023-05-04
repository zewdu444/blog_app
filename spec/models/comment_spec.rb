require 'rails_helper'

RSpec.describe Comment, :type => :model do
  user= User.new( name: "Anything",
    photo: "http://licalhost:3000/anything.jpg",
    bio:"Anything test",
    posts_counter: 0
  )
  post = Post.new(
    title: "Anything",
    text: "Anything test",
    author:user,
    comments_counter: 0,
    likes_counter:0,
  )
   subject { described_class.new(
    text: "TEst comments",
    author:user,
    post:post
    )
  }
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end
  it "it is  valid without a comment" do
    subject.text =nil
    expect(subject).to be_valid
  end

end

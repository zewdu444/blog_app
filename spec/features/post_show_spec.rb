require 'rails_helper'
RSpec.describe 'Post show page:', type: :feature do
  before(:each) do
    @user_one = User.new(name: 'unique_show', photo: 'http://localhost:3000/anything.jpg', bio: 'Anything test')
    @user_one.save
    @post_one = Post.new(title: 'post one', text: 'post one text', author: @user_one)
    @post_two = Post.new(title: 'post two', text: 'post two text', author: @user_one)
    @post_three = Post.new(title: 'post three', text: 'post three text', author: @user_one)
    @post_four = Post.new(title: 'post four', text: 'post four text', author: @user_one)
    @post_one.save
    @post_two.save
    @post_three.save
    @post_four.save
    @comment_one = Comment.new(text: 'comment one', author: @user_one, post: @post_one)
    @comment_two = Comment.new(text: 'comment two', author: @user_one, post: @post_one)
    @comment_three = Comment.new(text: 'comment three', author: @user_one, post: @post_one)
    @comment_four = Comment.new(text: 'comment four', author: @user_one, post: @post_one)
    @comment_five = Comment.new(text: 'comment five', author: @user_one, post: @post_one)
    @comment_one.save
    @comment_two.save
    @comment_three.save
    @comment_four.save
    @comment_five.save
    @like_one = Like.new(author: @user_one, post: @post_one)
    @like_one.save
  end
  scenario  'I can see the posts title.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.title)
  end
  scenario 'I can see who wrote the post' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.author.name)
  end
  scenario 'I can see how many comments it has.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.comments.count)
  end
  scenario 'I can see how many likes it has.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@post_one.likes.count)
  end
  scenario ' I can see the post body.' do
      visit user_post_path(@user_one.id, @post_one.id)
      expect(page).to have_content(@post_one.text)
   end
  scenario 'I can see the username of each commentor.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@comment_one.author.name)
    expect(page).to have_content(@comment_two.author.name)
    expect(page).to have_content(@comment_three.author.name)
    expect(page).to have_content(@comment_four.author.name)
    expect(page).to have_content(@comment_five.author.name)
  end
  scenario 'I can see the body of each comment.' do
    visit user_post_path(@user_one.id, @post_one.id)
    expect(page).to have_content(@user_one.posts.first.comments.first.text)
    expect(page).to have_content(@user_one.posts.first.comments.second.text)
    expect(page).to have_content(@user_one.posts.first.comments.third.text)
    expect(page).to have_content(@user_one.posts.first.comments.fourth.text)
    expect(page).to have_content(@user_one.posts.first.comments.fifth.text)
  end
end
require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'Post GET /index' do
    user = User.new(name: 'Anything',
                    photo: 'http://licalhost:3000/anything.jpg',
                    bio: 'Anything test',
                    posts_counter: 0)
    user.save
    post = Post.new(
      title: 'Anything',
      text: 'Anything test',
      author: user,
      comments_counter: 0,
      likes_counter: 0
    )
    post.save
    it 'return post http success' do
      get "/users/#{user.id}/posts/"
      expect(response).to have_http_status(200)
    end
    it 'return success for detail post' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(200)
    end
    it 'rendered post template' do
      get "/users/#{user.id}/posts/"
      expect(response).to render_template(:index)
    end
    it 'rendered post detail template' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end
    it 'post responsed body with correct place holder' do
      get "/users/#{user.id}/posts/"
      expect(response.body).to include('list of posts for a given user ')
    end
    it 'post detail responsed body with correct place holder' do
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Post detail with comments ')
    end
  end
end

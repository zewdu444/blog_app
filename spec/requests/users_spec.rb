require 'rails_helper'
RSpec.describe "Users", type: :request do
  describe "User GET/ index " do
    user = User.new(name: 'Anything',
                    photo: 'http://licalhost:3000/anything.jpg',
                    bio: 'Anything test',
                    posts_counter: 0
                  )
     user.save
    it  "return user http success" do
      get "/users/"
      expect(response).to have_http_status(200)
    end
    it "return success for detail user" do
      get "/users/#{user.id}"
      expect(response).to have_http_status(200)
    end
    it "rendered user template" do
      get "/users/"
      expect(response).to render_template(:index)
    end
    it "rendered user detail template" do
      get "/users/#{user.id}"
      expect(response).to render_template(:show)
    end
    it "user responsed body with correct place holder" do
      get "/users/"
      expect(response.body).to include("List of users")
    end
    it "user detail responsed body with correct place holder" do
      get "/users/#{user.id}"
      expect(response.body).to include("A given User detail with posts")
    end
  end
end

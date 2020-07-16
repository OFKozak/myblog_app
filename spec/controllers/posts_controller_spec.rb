# spec/controllers/posts_controller_spec.rb
require 'rails_helper'

describe PostsController, :type => :controller do
  describe "GET #index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    before { Post.create!(id: 33, title: "Post # 33", body: "It is the text of the post # 33") }
    it "renders the :show view" do
      get :show, params: { id: 33 }
      expect(response).to render_template("show")
    end
  end

  describe "POST post#create" do
    it "creates a new post" do
      expect {
        Post.create!(id: 100, title: "Ruby on Rails", body: "Text about Ruby on Rails")
      }.to change(Post, :count).by(1)
    end
  end
end

# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with a title and a body" do
    post = Post.new(
    title: "Post # 33",
    body:  "It is the text of the post # 33",
    )
    expect(post).to be_valid
  end

  it "is invalid without a title" do
     post = Post.new(title: nil)
     post.valid?
     expect(post.errors[:title]).to include("can't be blank")
  end

  it "is invalid without a body" do
     post = Post.new(body: nil)
     post.valid?
     expect(post.errors[:body]).to include("can't be blank")
  end

  it "is invalid with a too short title" do
    post = Post.new(title: "Rob")
    post.valid?
    expect(post.errors[:title]).to include("is too short (minimum is 5 characters)")
  end

  it "is invalid with a too long body" do
    post = Post.new(body: "text"*36)
    post.valid?
    expect(post.errors[:body]).to include("is too long (maximum is 140 characters)")
  end
end

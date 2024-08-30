require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { User.create(email: 'test@example.com', password: 'password123', password_confirmation: 'password123') }
  let(:valid_attributes) {
    { title: 'Test Post', content: 'This is a test post.', user_id: user.id }
  }
  let(:invalid_attributes) {
    { title: nil, content: nil }
  }

  describe "GET #index" do
    it "assigns @posts and renders the index template" do
      post = Post.create! valid_attributes
      get :index
      expect(assigns(:posts)).to eq([post])
      expect(response).to render_template("index")
    end
  end

  describe "GET #new" do
    it "assigns a new post as @post" do
      get :new
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: { post: valid_attributes }
        }.to change(Post, :count).by(1)
      end

      it "redirects to the posts list" do
        post :create, params: { post: valid_attributes }
        expect(response).to redirect_to(Post.last)
      end
    end

    context "with invalid params" do
      it "does not create a new Post" do
        expect {
          post :create, params: { post: invalid_attributes }
        }.to change(Post, :count).by(0)
      end

      it "re-renders the 'new' template" do
        post :create, params: { post: invalid_attributes }
        expect(response).to render_template("new")
      end
    end
  end
end

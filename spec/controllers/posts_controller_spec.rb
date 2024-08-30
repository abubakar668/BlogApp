require 'rails_helper'

RSpec.describe PostsController, type: :controller do
    let(:user) { User.create(email: 'test@example.com', password: 'password123', password_confirmation: 'password123') }

    before(:each) do
        sign_in user
    end

    describe "GET #index" do
        it "assigns @posts and renders the index template" do
        post = Post.create!(title: 'Test Post', content: 'This is a test post.', user: user)
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
end

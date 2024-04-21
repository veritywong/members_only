class PostsController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.update(user_id: current_user.id)
        if @post.save
            redirect_to :posts
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :content)
    end
end
class PostsController < ApplicationController
    before_action :require_logged_in

    def new
        @post = Post.new
        render :new
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to post_url(@post)
        else
            flash.now[:errors] = @post.errors.full_messages
            render :new
        end
    end


    def show
        @post = Post.find_by(id: params[:id])
        render :show
    end

    def edit
        @post = Post.find_by(id: params[:id])
        render :edit
    end

    def update
        @post = Post.find_by(id: params[:id])
        if @post && current_user.id == @post.author.id
            if @post.update(post_params)
                redirect_to post_url(@post)
            else
                @post = Post.new(post_params)
                flash.now[:errors] = @post.errors.full_messages
                render :edit
            end
        end
    end

    private

    def post_params
        params.require(:post).permit(:title, :url, :content, :sub_id, :author)
    end
end

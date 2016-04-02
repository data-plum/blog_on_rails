class PostsController < ApplicationController
	before_action :logged_in_user, only: %i[create destroy show]
  before_action :correct_user,   only: :destroy

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new(content: '', user_id: current_user.id, post_id: @post.id) 
  end

	def create
		@post = current_user.posts.build(post_params)
    	if @post.save
      	flash[:success] = "Post created!"
      	redirect_to root_url
    	else
      	redirect_to :back
    	end
	end

	def destroy
    @post.destroy
    flash[:success] = "Post deleted"
    redirect_to request.referrer || root_url
	end

	private
    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end

    def post_params
      params.require(:post).permit(:content)
    end
end

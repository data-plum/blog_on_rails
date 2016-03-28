class CommentsController < ApplicationController
	before_action :logged_in_user, only: %i[create destroy]
	before_action :correct_user,   only: :destroy


	def create
		@post = Post.find(params[:post_id])
		@user = current_user
		@comment = @post.comments.build(comment_params)
    	@comment.user_id = current_user.id
    	if @comment.save
      		flash[:success] = "comment created!"
      	end
      	redirect_to post_path(@post)
	end		

	def destroy
		@comment.destroy
  	flash[:success] = "Comment deleted"
 		redirect_to request.referrer || root_url
	end


	private
    def comment_params
    	params.require(:comment).permit(:content)
    end

    def correct_user
      @comment = current_user.comments.find_by(id: params[:id])
      redirect_to root_url if @comment.nil?
    end
end

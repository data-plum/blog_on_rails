class CommentsController < ApplicationController
	before_action :logged_in_user, only: %i[create destroy]

	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.build(comment_params)
    	@comment.user_id = current_user.id
    	if @comment.save
      		flash[:success] = "comment created!"
      		redirect_to post_path(@post)
      	   	else
      		redirect_to post_path(@post)
    	end
	end		


	private
	    def comment_params
	    	params.require(:comment).permit(:content)
	    end

end

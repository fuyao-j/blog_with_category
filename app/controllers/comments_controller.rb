class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.parent_type=='Post'
      @stream = Post.find(@comment.parent_id)
    else
      @stream = Category.find(@comment.parent_id)
    end

    if @comment.save
      CommentsChannel.broadcast_to(@stream, @comment)
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author, :content, :parent_id, :parent_type)
    end
end

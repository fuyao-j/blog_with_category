class CommentsChannel < ApplicationCable::Channel
  def subscribed
    if params[:type]=="Post"
      stream = Post.find(params[:id])
    elsif params[:type]=="Category"
      stream = Category.find(params[:id])
    end
    stream_for stream
  end
end
class CommentsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

  def index
    @comments = Comment.all
    render json: @comments
  end

  def create
    @comment = Comment.new(body: "let's go home")
    @comment.save
    render action: 'index'
    # post /comments
  end
end

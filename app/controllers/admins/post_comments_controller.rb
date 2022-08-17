class Admins::PostCommentsController < ApplicationController
  def index
    @post_comments = PostComment.all
    @post_comment = PostComment.page(params[:page])

  end
end

class CommentsController < ApplicationController

  def create
    @work = Work.find_by_id(params[:id])
    @comment = @work.comments.build(params.require(:comment).permit(:body))
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Your comment was added."
      redirect_to work_path(@work)
    else
      renter 'works/show'
    end
  end

end
class WorksController < ApplicationController

  def index
    @works = Work.all.reverse
  end

  def show
    @work = Work.find_by(params[:id])
    @comment = Comment.new
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.user = current_user

    if @work.save
      flash[:notice] = "Your submission was added!"
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @work.update(work_params)
      flash[:notice] = "This work of art was updated."
      redirect_to work_path(@work)
    else
      render :edit
  end

  private

  def work_params
    params.require(:work).permit(:title, :date, :city, saint_ids: [])
  end

  def set_work
    @work = Work.find_by(params[:id])
  end

  def require_user
    access_denied unless logged_in? && (current_user == @work.user || current_user.admin?)
  end
end
end
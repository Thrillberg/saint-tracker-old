class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update]
  before_action :require_user, except: [:index, :show]
  before_action :require_creator, only: [:edit, :update]

  def index
    @works = Work.all.shuffle
    @saints = Saint.all
    @artists = Artist.all
    @hash = Gmaps4rails.build_markers(@works) do |work, marker|
      marker.lat work.latitude
      marker.lng work.longitude
      marker.infowindow work.title
    end
  end

  def show
    @work = Work.find_by(slug: params[:id])
    @comment = Comment.new
    @hash = Gmaps4rails.build_markers(@work) do |work, marker|
      marker.lat work.latitude
      marker.lng work.longitude
      marker.infowindow work.title
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.user = current_user

    if @work.save
      flash[:notice] = "Your submission was added!"
      redirect_to works_path
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
  end

  def destroy
    Work.find_by(slug: params[:id]).destroy
    flash[:success] = "Your submission has been deleted."
    redirect_to root_path
  end

  private

  def work_params
    params.require(:work).permit(:title, :date, :city, :image, :artist_id, saint_ids: [])
  end

  def set_work
    @work = Work.find_by(slug: params[:id])
  end

  def require_creator
    access_denied unless logged_in? && (current_user == @work.user || current_user.admin?)
  end

    def artist_params
    params.require(:artist_id).permit(:name, :dates)
  end

end

class SaintsController < ApplicationController
  def new
    @saint = Saint.new
  end

  def create
    @saint = Saint.new(saint_params)

    if @saint.save
      flash[:notice] = "Your saint has been added."
      redirect_to new_work_path
    else
      render :new
    end
  end

  def show
    @saint = Saint.find_by(slug: params[:id])
    @works = @saint.works.all
    @hash = Gmaps4rails.build_markers(@works) do |work, marker|
      marker.lat work.latitude
      marker.lng work.longitude
      marker.infowindow work.title
    end
  end

  private

  def saint_params
    params.require(:saint).permit(:name, :is_saint_of)
  end
end
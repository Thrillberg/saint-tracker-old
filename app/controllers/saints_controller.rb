class SaintsController < ApplicationController
  def new
    @saint = Saint.new
  end

  def create
    @saint = Saint.new(saint_params)

    if @saint.save
      flash[:notice] = "Your saint has been added."
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @saint = Saint.find_by(params[:id])
  end

  private

  def saint_params
    params.require(:saint).permit(:name, :is_saint_of)
  end
end
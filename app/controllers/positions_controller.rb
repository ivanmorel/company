class PositionsController < ApplicationController
  def index
    @positions = Position.all
  end
  def new
    @position = Position.new
  end

  def create
    # render plain: params.inspect
    @position = Position.new(position_params)
    if @position.save
      redirect_to positions_path
    else render 'new'
    end
  end

  def edit
    @position = Position.find(params[:id])
  end

  def update
    @position = Position.find(params[:id])
    if @position.update(position_params)
      redirect_to positions_path
    else render 'edit'
    end
  end

  def destroy
    # render plain: params.inspect
    @position = Position.find(params[:id])
    @position.destroy
    redirect_to positions_path
  end

  private
  def position_params
    params.require(:position).permit(:name, :description, :status_id)
  end
end

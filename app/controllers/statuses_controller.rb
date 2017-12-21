class StatusesController < ApplicationController
  def index
    @statuses = Status.all
  end
  def new
    @status = Status.new
  end

  def json
    render json: Status.all
  end
  def create
    @status = Status.new(status_params)
    if @status.save
      redirect_to statuses_path
    else render 'new'
    end
  end

  def edit
    @status = Status.find(params[:id])
  end

  def update
    @status = Status.find(params[:id])
    if @status.update(status_params)
      redirect_to statuses_path
    else render 'edit'
    end
  end

    def destroy
    # render plain: params.inspect
    @status = Status.find(params[:id])
    @status.destroy

    redirect_to statuses_path
  end

  private
   def status_params
     params.require(:status).permit(:name, :description)
   end
end

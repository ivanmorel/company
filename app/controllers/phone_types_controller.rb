class PhoneTypesController < ApplicationController
  def index
    
    @phonetypes = PhoneType.all
  end
  def new
    @phonetype = PhoneType.new
  end

  def create
    # render plain: params.inspect
    @phonetype = PhoneType.new(phonetype_params)
    if @phonetype.save
      redirect_to phone_types_path
    else render 'new'
    end
  end

  def edit
    @phonetype = PhoneType.find(params[:id])
  end

  def update
    @phonetype = PhoneType.find(params[:id])
    if @phonetype.update(phonetype_params)
      redirect_to phone_types_path
    else render 'edit'
    end
  end

  def destroy
    # render plain: params.inspect
    @phonetype = PhoneType.find(params[:id])
    @phonetype.destroy
    redirect_to phone_types_path
  end

  private
  def phonetype_params
    params.require(:phone_type).permit(:name, :description, :status_id)
  end
end

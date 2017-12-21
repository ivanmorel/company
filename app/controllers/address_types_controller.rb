class AddressTypesController < ApplicationController
  def index

    @addresstypes = AddressType.all
  end
  def new
    @addresstype = AddressType.new
  end

  def create
    # render plain: params.inspect
    @addresstype = AddressType.new(addresstype_params)
    if @addresstype.save
      redirect_to address_types_path
    else render 'new'
    end
  end

  def edit
    @addresstype = AddressType.find(params[:id])
  end

  def update
    @addresstype = AddressType.find(params[:id])
    if @addresstype.update(addresstype_params)
      redirect_to address_types_path
    else render 'edit'
    end
  end

  def destroy
    # render plain: params.inspect
    @addresstype = AddressType.find(params[:id])
    @addresstype.destroy
    redirect_to address_types_path
  end

  private
  def addresstype_params
    params.require(:address_type).permit(:name, :description, :status_id)
  end
end

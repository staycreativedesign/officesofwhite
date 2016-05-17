class Admin::OfficeLocationsController < AdminsController
  def index
    @office_locations = OfficeLocation.all
  end

  def new
    @office = OfficeLocation.new
  end

  def show
    find_office
  end

  def edit
    find_office
  end

  def update
    find_office
  end

  def create
    @office = OfficeLocation.new(office_params)
    if @office.save
      redirect_to admin_office_locations_path
      flash[:notice] = "Office Location created"
    else
      render :new
      flash[:notice] = "Office Location not created"
    end
  end

  def destroy
  end

  private

  def find_office
    @office = OfficeLocation.find(params[:id])
  end

  def office_params
    params.require(:office_location).permit!
  end
end

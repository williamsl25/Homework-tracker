class LocationsController < ApplicationController
  def index
    @locations = Location.all
    
  end

  def show
    @location = Location.find params[:id]
    @courses = @location.courses
    
  end 

  # GET /locations/new
  def new
    @location = Location.new
    @courses = Course.all
  end

  # GET /locations/1/edit
  def edit
    @location = Location.find params[:id]
    @courses = Course.all
  end

  # POST /locations
  def create
    @location = Location.create location_params
    @courses = Course.all
    
    if @location.save
      flash[:notice] = "#{@location.name} information successsfully saved."
      redirect_to locations_path
    else
      flash[:error] = 'Location NOT successfully saved.'
      render :new
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    @courses = Course.all
    @location = Location.find params[:id]
    
    if @location.update location_params
      flash[:notice] = "#{@location.name} information successsfully updated."
      redirect_to locations_path
    else
      flash[:error] = 'Location NOT successfully saved.'
      render :new
    end
    
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
 def destroy
    @location = Location.find params[:id]
    @location.delete
    flash[:notice] = "#{@location.name} successfully deleted."
    redirect_to locations_path
  end


  private
  def location_params
    params.require(:location).permit(
      :name,
      :address
      )
  end
      
   
end

class GeofencesController < ApplicationController
  before_action :set_geofence, only: [:show, :edit, :update, :destroy]

  # GET /geofences
  # GET /geofences.json
  def index
    @geofences = Geofence.all
  end

  # GET /geofences/1
  # GET /geofences/1.json
  def show
  end

  # GET /geofences/new
  def new
    @geofence = Geofence.new
  end

  # GET /geofences/1/edit
  def edit
  end

  # POST /geofences
  # POST /geofences.json
  def create
    session[:return_to] ||= request.referer
    param = params[:geofence]
    @geofence = Geofence.new(user_id: param[:user_id], post_id: param[:post_id], latitude: param[:latitude],
                             longitude: param[:longitude],region: param[:region])
    if param[:post_id] != ""
    post = Post.find(param[:post_id])

    respond_to do |format|
      if @geofence.save
        format.html { redirect_to edit_home_path(post) , notice: 'Geofence was successfully created.' }
        format.json { render :show, status: :created, location: @geofence }
      else
        format.html { render :new }
        format.json { render json: @geofence.errors, status: :unprocessable_entity }
      end
    end
    else
      @user_profile = UserProfile.find(session["warden.user.user.key"][0][0])
      respond_to do |format|
        if @geofence.save
          format.html { redirect_to edit_user_profile_path(@user_profile) , notice: 'Geofence was successfully created.' }
          format.json { render :show, status: :created, location: @geofence }
        else
          format.html { render :new }
          format.json { render json: @geofence.errors, status: :unprocessable_entity }
        end
      end
      end
  end

  # PATCH/PUT /geofences/1
  # PATCH/PUT /geofences/1.json
  def update
    respond_to do |format|
      if @geofence.update(geofence_params)
        if params[:geofence][:post_id] != ""
        post = Post.find(params[:geofence][:post_id])
        format.html { redirect_to edit_home_path(post), notice: 'Geofence was successfully updated.' }
        format.json { render :show, status: :ok, location: @geofence }
        else
          @user_profile = UserProfile.find(session["warden.user.user.key"][0][0])
          format.html { redirect_to edit_user_profile_path(@user_profile), notice: 'Geofence was successfully updated.' }
          format.json { render :show, status: :ok, location: @geofence }
          end

      else
        format.html { render :edit }
        format.json { render json: @geofence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geofences/1
  # DELETE /geofences/1.json
  def destroy
    @geofence.destroy
    respond_to do |format|
      format.html { redirect_to geofences_url, notice: 'Geofence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_geofence
      @geofence = Geofence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geofence_params
      params.require(:geofence).permit(:user_id, :region, :latitude, :longitude, :post_id)
    end
end

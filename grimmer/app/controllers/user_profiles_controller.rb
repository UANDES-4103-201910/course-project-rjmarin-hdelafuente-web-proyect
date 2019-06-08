class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]

  # GET /user_profiles
  # GET /user_profiles.json
  def index
    @user_profiles = UserProfile.all
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show

    @vote =PostVote.where("user_id = ? AND vote = ?",@user_profile.id,true).count
    @downvote = PostVote.where("user_id = ? AND vote = ?",@user_profile.id,false).count
    @commentc = PostComment.where("user_id = ? ", @user_profile.id).count

    @postf = PostShare.select("post_id").where('user_id = ? ', params[:id]).reverse
    @posts = Post.where('user_id = ? ', params[:id]).reverse
  end

  # GET /user_profiles/new
  def new
    @user_profile = UserProfile.new
  end

  # GET /user_profiles/1/edit
  def edit
  end

  # POST /user_profiles
  # POST /user_profiles.json
  def create
    @user_profile = UserProfile.new(user_profile_params)

    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to @user_profile, notice: 'User profile was successfully created.' }
        format.json { render :show, status: :created, location: @user_profile }
      else
        format.html { render :new }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        format.html { redirect_to @user_profile, notice: 'User profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url, notice: 'User profile was successfully destroyed.' }
      format.json { head :no_content }
    end

  end

  def username_show
    @user_profile = UserProfile.where(username: params[:username]).first

    redirect_to user_profile_path(@user_profile)
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      if '1234567890'[params[:id][0]]
      if @user_profile = UserProfile.find(params[:id])
        @user_profile
      else
        @user_profile = UserProfile.create(user_id: params[:id])
      end
      else
        if @user_profile = UserProfile.where("username=?",params[:id])
          @user_profile
         end
      end

    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:user_id, :bio, :city, :country, :profile_picture, :location, :username)
    end
end

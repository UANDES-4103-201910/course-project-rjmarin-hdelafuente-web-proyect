class DumpstersController < ApplicationController
  before_action :set_dumpster, only: [:show, :edit, :update, :destroy]

  # GET /dumpsters
  # GET /dumpsters.json
  def index
    @dumpsters = Dumpster.all

  end

  def show
  end

  # POST /dumpsters
  # POST /dumpsters.json
  def create
    Post.update(params[:post_id], visibility: false)
    @dumpster = Dumpster.create(post_id: params[:post_id])
    if @dumpster.save
      flash[:success] = "The post is now in the dumpster."
      redirect_to admin_path
    else
      flash[:error] = "Couldn't send the post to the dumpster"
      redirect_to admin_path
    end

  end

  # DELETE /dumpsters/1
  # DELETE /dumpsters/1.json
  def destroy
    Post.update(params[:post_id], visibility: true )
    @dumpster = Dumpster.find_by(params[:post_id])
    @dumpster.destroy
    if @dumpster.destroy
      flash[:success] = "The post is visible again"
      redirect_to admin_path
    else
      flash[:error] = "Couldn't make post visible"
      redirect_to admin_path
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_dumpster
    @dumpster = Dumpster.find_by(post_id: params[:post_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dumpster_params
    params.require(:dumpster).permit(:post_id)
  end
end

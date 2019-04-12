class PostSharesController < ApplicationController
  before_action :set_post_share, only: [:show, :edit, :update, :destroy]

  # GET /post_shares
  # GET /post_shares.json
  def index
    @post_shares = PostShare.all
  end

  # GET /post_shares/1
  # GET /post_shares/1.json
  def show
  end

  # GET /post_shares/new
  def new
    @post_share = PostShare.new
  end

  # GET /post_shares/1/edit
  def edit
  end

  # POST /post_shares
  # POST /post_shares.json
  def create
    @post_share = PostShare.new(post_share_params)

    respond_to do |format|
      if @post_share.save
        format.html { redirect_to @post_share, notice: 'Post share was successfully created.' }
        format.json { render :show, status: :created, location: @post_share }
      else
        format.html { render :new }
        format.json { render json: @post_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_shares/1
  # PATCH/PUT /post_shares/1.json
  def update
    respond_to do |format|
      if @post_share.update(post_share_params)
        format.html { redirect_to @post_share, notice: 'Post share was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_share }
      else
        format.html { render :edit }
        format.json { render json: @post_share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_shares/1
  # DELETE /post_shares/1.json
  def destroy
    @post_share.destroy
    respond_to do |format|
      format.html { redirect_to post_shares_url, notice: 'Post share was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_share
      @post_share = PostShare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_share_params
      params.require(:post_share).permit(:post_id, :user_id)
    end
end

class PostReportsController < ApplicationController
  before_action :set_post_report, only: [:show, :edit, :update, :destroy]

  # GET /post_reports
  # GET /post_reports.json
  def index
    @post_reports = PostReport.all
  end

  # GET /post_reports/1
  # GET /post_reports/1.json
  def show
  end

  # GET /post_reports/new
  def new
    @post_report = PostReport.new
  end

  # GET /post_reports/1/edit
  def edit
  end

  # POST /post_reports
  # POST /post_reports.json
  def create
    @post_report = PostReport.new(user_id: params[:user_id], post_id: params[:post_id], comment_report: params[:post_report][:comment_report])


    respond_to do |format|
      if @post_report.save
        format.js
        format.html { redirect_back(fallback_location: root_path) }
        format.json { render :@post_report, status: :created, location: @post_report }
      else
        format.html { render :new }
        format.json { render json: @post_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_reports/1
  # PATCH/PUT /post_reports/1.json
  def update
    respond_to do |format|
      if @post_report.update(post_report_params)
        format.html { redirect_to @post_report, notice: 'Post report was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_report }
      else
        format.html { render :edit }
        format.json { render json: @post_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_reports/1
  # DELETE /post_reports/1.json
  def destroy
    @post_report.destroy
    respond_to do |format|
      format.html { redirect_to post_reports_url, notice: 'Post report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_report
      @post_report = PostReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_report_params
      params.require(:post_report).permit(:post_id, :user_id, :comment_report)
    end
end

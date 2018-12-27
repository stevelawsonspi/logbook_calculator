class LogbookPagesController < ApplicationController
  before_action :set_logbook_page, only: [:show, :edit, :update, :destroy]

  # GET /logbook_pages
  # GET /logbook_pages.json
  def index
    @logbook_pages = LogbookPage.all
  end

  # GET /logbook_pages/1
  # GET /logbook_pages/1.json
  def show
  end

  # GET /logbook_pages/new
  def new
    @logbook_page = LogbookPage.new
  end

  # GET /logbook_pages/1/edit
  def edit
  end

  # POST /logbook_pages
  # POST /logbook_pages.json
  def create
    @logbook_page = LogbookPage.new(logbook_page_params)

    respond_to do |format|
      if @logbook_page.save
        format.html { redirect_to @logbook_page, notice: 'Logbook page was successfully created.' }
        format.json { render :show, status: :created, location: @logbook_page }
      else
        format.html { render :new }
        format.json { render json: @logbook_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logbook_pages/1
  # PATCH/PUT /logbook_pages/1.json
  def update
    respond_to do |format|
      if @logbook_page.update(logbook_page_params)
        format.html { redirect_to @logbook_page, notice: 'Logbook page was successfully updated.' }
        format.json { render :show, status: :ok, location: @logbook_page }
      else
        format.html { render :edit }
        format.json { render json: @logbook_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logbook_pages/1
  # DELETE /logbook_pages/1.json
  def destroy
    @logbook_page.destroy
    respond_to do |format|
      format.html { redirect_to logbook_pages_url, notice: 'Logbook page was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logbook_page
      @logbook_page = LogbookPage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logbook_page_params
      params.require(:logbook_page).permit(:logbook_id, :page_number)
    end
end

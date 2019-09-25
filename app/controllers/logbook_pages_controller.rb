class LogbookPagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_logbook
  before_action :set_logbook_page, only: [:show, :edit, :update, :destroy]

  def index
    @logbook_pages = LogbookPage.for_logbook(@logbook.id).latest_page_first
  end

  def show
  end

  def new
    @logbook_page = LogbookPage.new(logbook_id: @logbook.id)
    8.times do 
      @logbook_page.logbook_entries.build(
        day_start_time:   @logbook.default_day_start_time,
        day_end_time:     @logbook.default_day_end_time,
        night_start_time: @logbook.default_night_start_time,
        night_end_time:   @logbook.default_night_end_time,
      )
    end
  end

  def edit
  end

  def create
    @logbook_page = LogbookPage.new(logbook_page_params)
    @logbook_page.logbook_id = @logbook.id
    
    respond_to do |format|
      if @logbook_page.save
        format.html { redirect_to logbook_logbook_pages_path(@logbook), notice: 'Logbook page was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @logbook_page.update(logbook_page_params)
        format.html { redirect_to logbook_logbook_pages_path(@logbook), notice: 'Logbook page was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @logbook_page.destroy
    respond_to do |format|
      format.html { redirect_to logbook_logbook_pages_path(@logbook), notice: 'Logbook page was successfully destroyed.' }
    end
  end

  private
    
    def set_logbook
      @logbook = Logbook.find(params[:logbook_id])
    end

    def set_logbook_page
      @logbook_page = LogbookPage.find(params[:id])
    end
    
    def logbook_page_params
      params.require(:logbook_page).permit(:logbook_id, :page_number, 
        logbook_entries_attributes: [
          :id, :day_hours, :day_minutes, :night_hours, :night_minutes,
          :day_start_time, :day_end_time, :night_start_time, :night_end_time, :_destroy
        ])
    end
end

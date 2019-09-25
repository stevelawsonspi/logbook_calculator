class LogbooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_logbook, only: [:show, :edit, :update, :destroy]

  def index
    @logbooks = Logbook.all
  end

  def show
  end

  def new
    @logbook = Logbook.new
    @logbook.start_page_number        = 43
    @logbook.default_day_start_time   = '11:00'
    @logbook.default_day_end_time     = '13:30'
    @logbook.default_night_start_time = '18:00'
    @logbook.default_night_end_time   = '19:30'
  end

  def edit
  end

  def create
    @logbook = Logbook.new(logbook_params)

    respond_to do |format|
      if @logbook.save
        format.html { redirect_to @logbook, notice: 'Logbook was successfully created.' }
        format.json { render :show, status: :created, location: @logbook }
      else
        format.html { render :new }
        format.json { render json: @logbook.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @logbook.update(logbook_params)
        format.html { redirect_to @logbook, notice: 'Logbook was successfully updated.' }
        format.json { render :show, status: :ok, location: @logbook }
      else
        format.html { render :edit }
        format.json { render json: @logbook.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @logbook.destroy
    respond_to do |format|
      format.html { redirect_to logbooks_url, notice: 'Logbook was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logbook
      @logbook = Logbook.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logbook_params
      params.require(:logbook).permit(
        :name, :start_page_number, :start_day_hours, :start_day_minutes, :start_night_hours, :start_night_minutes,
        :default_day_start_time, :default_day_end_time, :default_night_start_time, :default_night_end_time
      )
    end
end

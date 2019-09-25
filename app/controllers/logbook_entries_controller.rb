class LogbookEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_logbook_entry, only: [:show, :edit, :update, :destroy]

  # GET /logbook_entries
  # GET /logbook_entries.json
  def index
    @logbook_entries = LogbookEntry.all
  end

  # GET /logbook_entries/1
  # GET /logbook_entries/1.json
  def show
  end

  # GET /logbook_entries/new
  def new
    @logbook_entry = LogbookEntry.new
  end

  # GET /logbook_entries/1/edit
  def edit
  end

  # POST /logbook_entries
  # POST /logbook_entries.json
  def create
    @logbook_entry = LogbookEntry.new(logbook_entry_params)

    respond_to do |format|
      if @logbook_entry.save
        format.html { redirect_to @logbook_entry, notice: 'Logbook entry was successfully created.' }
        format.json { render :show, status: :created, location: @logbook_entry }
      else
        format.html { render :new }
        format.json { render json: @logbook_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /logbook_entries/1
  # PATCH/PUT /logbook_entries/1.json
  def update
    respond_to do |format|
      if @logbook_entry.update(logbook_entry_params)
        format.html { redirect_to @logbook_entry, notice: 'Logbook entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @logbook_entry }
      else
        format.html { render :edit }
        format.json { render json: @logbook_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /logbook_entries/1
  # DELETE /logbook_entries/1.json
  def destroy
    @logbook_entry.destroy
    respond_to do |format|
      format.html { redirect_to logbook_entries_url, notice: 'Logbook entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_logbook_entry
      @logbook_entry = LogbookEntry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def logbook_entry_params
      params.require(:logbook_entry).permit(:logbook_page_id, :day_minutes, :night_minutes)
    end
end

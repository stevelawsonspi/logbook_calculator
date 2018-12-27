class LogbooksController < ApplicationController
  before_action :set_logbook, only: [:show, :edit, :update, :destroy]

  # GET /logbooks
  # GET /logbooks.json
  def index
    @logbooks = Logbook.all
  end

  # GET /logbooks/1
  # GET /logbooks/1.json
  def show
  end

  # GET /logbooks/new
  def new
    @logbook = Logbook.new
  end

  # GET /logbooks/1/edit
  def edit
  end

  # POST /logbooks
  # POST /logbooks.json
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

  # PATCH/PUT /logbooks/1
  # PATCH/PUT /logbooks/1.json
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

  # DELETE /logbooks/1
  # DELETE /logbooks/1.json
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
      params.require(:logbook).permit(:name)
    end
end

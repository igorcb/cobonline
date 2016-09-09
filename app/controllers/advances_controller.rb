class AdvancesController < ApplicationController
  before_action :authenticate_user!
  before_action :user_admin
  before_action :set_advance, only: [:show, :edit, :update, :destroy, :recalculation]

  # GET /advances
  # GET /advances.json
  def index
    @advances = Advance.order_desc
  end

  # GET /advances/1
  # GET /advances/1.json
  def show
  end

  # GET /advances/new
  def new
    @advance = Advance.new
  end

  # GET /advances/1/edit
  def edit
  end

  # POST /advances
  # POST /advances.json
  def create
    @advance = Advance.new(advance_params)

    respond_to do |format|
      if @advance.save
        format.html { redirect_to @advance, notice: 'Advance was successfully created.' }
        format.json { render :show, status: :created, location: @advance }
      else
        format.html { render :new }
        format.json { render json: @advance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advances/1
  # PATCH/PUT /advances/1.json
  def update
    respond_to do |format|
      if @advance.update(advance_params)
        format.html { redirect_to @advance, notice: 'Advance was successfully updated.' }
        format.json { render :show, status: :ok, location: @advance }
      else
        format.html { render :edit }
        format.json { render json: @advance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advances/1
  # DELETE /advances/1.json
  def destroy
    @advance.destroy
    respond_to do |format|
      format.html { redirect_to advances_url, notice: 'Advance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def recalculation
    puts ">>>>>>>>>>>>>>> Recalculation Advance ID: #{@advance.id}"
    @advance.recalculation
    redirect_to advances_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advance
      @advance = Advance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def advance_params
      #params.require(:advance).permit(:date_advance, :client_id, :price, :balance, :number_parts, :percent)
      params.require(:advance).permit(:date_advance, :client_id, :price, :number_parts, :percent)
    end


end

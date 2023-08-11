class RanksController < ApplicationController
  before_action :set_rank, only: %i[ show edit update destroy ]

  # GET /ranks or /ranks.json
  def index
    @ranks = Rank.all
  end

  # GET /ranks/1 or /ranks/1.json
  def show
  end

  # GET /ranks/new
  def new
    @rank = Rank.new
  end

  # GET /ranks/1/edit
  def edit
  end

  # POST /ranks or /ranks.json
  def create
    @rank = Rank.new(rank_params)

    respond_to do |format|
      if @rank.save
        format.html { redirect_to rank_url(@rank), notice: "Rank was successfully created." }
        format.json { render :show, status: :created, location: @rank }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ranks/1 or /ranks/1.json
  def update
    respond_to do |format|
      if @rank.update(rank_params)
        format.html { redirect_to rank_url(@rank), notice: "Rank was successfully updated." }
        format.json { render :show, status: :ok, location: @rank }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ranks/1 or /ranks/1.json
  def destroy
    @rank.destroy

    respond_to do |format|
      format.html { redirect_to ranks_url, notice: "Rank was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rank
      @rank = Rank.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rank_params
      params.require(:rank).permit(:name)
    end
end

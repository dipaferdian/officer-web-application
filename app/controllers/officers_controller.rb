class OfficersController < ApplicationController
  before_action only: %i[ index show create update destroy ]

  # GET /officers or /officers.json
  def index
    @officers = OfficerServices::OfficerGet.new(page: params[:page]).call
  end

  # GET /officers/1 or /officers/1.json
  def show
    @officer = OfficerServices::OfficerDetail.new(officer: __id__ = params[:id]).call
  end

  # POST /officers or /officers.json
  def create
    @officer = Officer.new(officer_params)

    respond_to do |format|
      if @officer.save
        format.html { redirect_to officer_url(@officer), notice: "Officer was successfully created." }
        format.json { render :show, status: :created, location: @officer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /officers/1 or /officers/1.json
  def update
    respond_to do |format|
      if @officer.update(officer_params)
        format.html { redirect_to officer_url(@officer), notice: "Officer was successfully updated." }
        format.json { render :show, status: :ok, location: @officer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @officer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /officers/1 or /officers/1.json
  def destroy
    @officer.destroy

    respond_to do |format|
      format.html { redirect_to officers_url, notice: "Officer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def officer_params
      params.require(:officer).permit(:name)
    end
end

class ExtendDemographiesController < ApplicationController
  before_action :set_extend_demography, only: [:show, :edit, :update, :destroy]

  # GET /extend_demographies
  # GET /extend_demographies.json
  def index
    @extend_demographies = ExtendDemography.all
  end

  # GET /extend_demographies/1
  # GET /extend_demographies/1.json
  def show
  end

  # GET /extend_demographies/new
  def new
    @extend_demography = ExtendDemography.new
  end

  # GET /extend_demographies/1/edit
  def edit
  end

  # POST /extend_demographies
  # POST /extend_demographies.json
  def create
    @extend_demography = ExtendDemography.new(extend_demography_params)

    respond_to do |format|
      if @extend_demography.save
        format.html { redirect_to :back, notice: 'Extend demography was successfully created.' }
        format.json { render :show, status: :created, location: @extend_demography }
      else
        format.html { render :new }
        format.json { render json: @extend_demography.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extend_demographies/1
  # PATCH/PUT /extend_demographies/1.json
  def update
    respond_to do |format|
      if @extend_demography.update(extend_demography_params)
        format.html { redirect_to  :back, notice: 'Extend demography was successfully updated.' }
        format.json { render :show, status: :ok, location: @extend_demography }
      else
        format.html { render :edit }
        format.json { render json: @extend_demography.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extend_demographies/1
  # DELETE /extend_demographies/1.json
  def destroy
    @extend_demography.destroy
    respond_to do |format|
      format.html { redirect_to extend_demographies_url, notice: 'Extend demography was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_extend_demography
      @extend_demography = ExtendDemography.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def extend_demography_params
      params.require(:extend_demography).permit(:user_id, :identification_id,
                                                emails_attributes: [:id, :email_type_id, :email_address, :note, :_destroy],
                                                social_media_attributes: [:id, :social_media_type_id, :social_media_handle, :note, :_destroy],
                                                addresses_attributes: [:id, :address_type, :address, :zip_code, :state, :city, :country_code, :_destroy],
                                                phones_attributes: [:id, :phone_type_id, :phone_number, :note, :_destroy],
                                                faxes_attributes:   [:id, :fax_type_id, :fax_number, :note, :_destroy],
                                                identifications_attributes:   [:id, :identification_number, :status, :date_expired, :issued_by, :note, :identification_type_id, :_destroy]
      )
    end
end

class CoreSettingsController < ApplicationController
  before_action :set_core_setting, only: [:edit, :update]
	before_action :authenticate_admin!

  # GET /core_settings/new
  def new
    @core_setting = CoreSetting.new
  end

  # GET /core_settings/1/edit
  def edit
  end

  # POST /core_settings
  # POST /core_settings.json
  def create
    @core_setting = CoreSetting.new(core_setting_params)

    respond_to do |format|
      if @core_setting.save
				format.html { redirect_to root_path, notice: 'Данные обновлены.' }
				format.json { render :edit, status: :created, location: @core_setting }
      else
				format.html { render :new }
        format.json { render json: @core_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /core_settings/1
  # PATCH/PUT /core_settings/1.json
  def update
    respond_to do |format|
      if @core_setting.update(core_setting_params)
				format.html { redirect_to root_path, notice: 'Данные обновлены.' }
				format.json { render :edit, status: :ok, location: @core_setting }
      else
        format.html { render :edit }
        format.json { render json: @core_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_core_setting
      @core_setting = CoreSetting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def core_setting_params
      params.require(:core_setting).permit(:name, :main_phone, :add_phone_1, :add_phone_2, :main_phone_multi, :add_phone_1_multi, :add_phone_2_multi, :main_email, :add_email, :address, :address_comment, :site_description, :map_lat, :map_lng, :map_name)
    end
end

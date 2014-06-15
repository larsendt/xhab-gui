class SpotsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: [:update]
  enable_sync

  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
  end

  def update
    @spot = Spot.find(params[:id]).decorate
    _params = spot_params
    if _params[:white_light_on].present?
      _params[:white_light_on] = Time.parse(spot_params[:white_light_on]).utc.seconds_since_midnight
    end
    if _params[:white_light_off].present?
      _params[:white_light_off] = Time.parse(spot_params[:white_light_off]).utc.seconds_since_midnight
    end
    if _params[:red_light_on].present?
      _params[:red_light_on] = Time.parse(spot_params[:red_light_on]).utc.seconds_since_midnight
    end
    if _params[:red_light_off].present?
      _params[:red_light_off] = Time.parse(spot_params[:red_light_off]).utc.seconds_since_midnight
    end
    @spot.update(_params)
    sync_update @spot 
    head 200
  end

private

  def spot_params
    params.require(:spot).permit(:set_air_temp_low, :set_air_temp_high,
                                 :set_water_temp_low, :set_water_temp_high,
                                 :set_rh_low, :set_rh_high,
                                 :set_ec_low, :set_ec_high,
                                 :set_ph_low, :set_ph_high,
                                 :set_co2_low, :set_co2_high,
                                 :set_do_low, :set_do_high,
                                 :white_light_on, :white_light_off,
                                 :red_light_on, :red_light_off,
                                 :pump_duration, :pump_frequency, 
                                 :air_temp, :water_temp, :rh, :ec, :ph, :co2, :do,
                                 :fans, :white_light_power, :red_light_power, :refresh, :enclosure,
                                 :name, :key, :started_on, :planted_with, :note)
  end
end

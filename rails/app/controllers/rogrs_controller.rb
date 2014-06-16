class RogrsController < ApplicationController
  def update
    rogr = Rogr.find(params[:id])
    rogr.update(rogr_params)
    head 200
  end

private

  def rogr_params
    params.require(:rogr).permit(:water_pump_power, :nutrient_pump_power,
                                 :water_level, :nutrient_level, :battery_level)
  end
end

class DashboardsController < ApplicationController
  def index
    @spot = Spot.first.decorate 
  end
end

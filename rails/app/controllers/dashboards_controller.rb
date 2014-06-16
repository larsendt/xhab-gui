class DashboardsController < ApplicationController
  def index
    @rogr = Rogr.first.decorate 
    @spot = Spot.first.decorate 
  end
end

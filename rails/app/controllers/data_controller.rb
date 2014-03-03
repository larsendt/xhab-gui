class DataController < ApplicationController
  def index
    @data = Datum.find(:all, conditions: ["source = '#{params[:source]}' AND property = '#{params[:property]}' AND timestamp >= #{Time.parse(params[:start]).to_i} AND timestamp <= #{Time.parse(params[:stop]).to_i}"])
    render json: @data
  end

  def current
    @data = Datum.find(:all, :order => "timestamp desc", :limit => 12)[0..5]
    render json: @data
  end
end

class DevicesController < ApplicationController
  before_action :set_device, only: [:show]

  def index
    @devices = Device.all
  end

  def show
  end

  private
  def set_device
    @device = Device.find params[:id]
  end
end

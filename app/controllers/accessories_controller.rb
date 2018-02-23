class AccessoriesController < ApplicationController
  before_action :set_accessory, only: [:show]

  def show
  end

  def index
    @accessories = Accessory.all
  end

  private

    def set_accessory
      @accessory = Accessory.find(params[:id])
    end

end

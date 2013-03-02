class HomeController < ApplicationController
  before_action :set_home

  def index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
    end
end

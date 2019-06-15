class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @personnal_town = current_user.town
    @personnal_town_coordinates = {lat: current_user.latitude, lng: current_user.longitude}
  end
end

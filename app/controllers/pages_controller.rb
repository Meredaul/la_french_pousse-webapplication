class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @personnal_town_marker = [{ lat: current_user.latitude, lng: current_user.longitude }]
  end
end

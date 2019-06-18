class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @participations_test = Participation.all
    @pousses_test = Pouss.all
    @companies_test = Company.all

    @personnal_town_marker = [{ lat: current_user.latitude, lng: current_user.longitude }]
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    current_user_latitude = current_user.latitude
    current_user_longitude = current_user.longitude

    @personnal_address_marker = [{ lat: current_user_latitude, lng: current_user_longitude }]
    @companies_around = Company.near([current_user_latitude, current_user_longitude],20, order: :distance)
    @companies_around_markers = @companies_around.map do |company|
      {
        lat: company.latitude,
        lng: company.longitude,
        infoWindow: render_to_string(partial: "infoWindow", locals: {company: company}),
        image_url: helpers.asset_url('logo.png')
      }
    end

    @random_company_around = @companies_around.sample
    #    @citoyens_address_marker = User.all.map{|user| {lat: user.latitude, lng: user.longitude}}
  end
end

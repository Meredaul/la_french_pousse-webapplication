class PagesController < ApplicationController
  before_action :set_coordinates, only: [:home]
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @personnal_address_marker = [{ lat: @center_lat, lng: @center_long }]
    @companies_around = Company.near([@center_lat, @center_long], 15, order: :distance)#.where(validated?: true)
    @hash_companies_around_grouped = Company.near([@center_lat, @center_long], 15, order: :distance).first(10).group_by(&:category_id)
    @companies_around_grouped = @hash_companies_around_grouped.map{|category_id, group| group }.flatten

    @companies_around_markers = @companies_around.map do |company|
      {
        lat: company.latitude,
        lng: company.longitude,
        infoWindow: render_to_string(partial: "infoWindow", locals: {company: company}),
        # image_url: helpers.asset_url('logo.png'),
        icon_url: helpers.asset_url("#{company.category.icon}"),
        company_id: company.id,
        passages_counter: company.company_passages.count + 1
      }
    end

    maximum_passages = @companies_around_markers.map{|c| c[:passages_counter]}.max + 1
    if maximum_passages == 0
      maximum_passages = 1
    end
    @personnal_address_marker << {maximum_passages: maximum_passages}

    @random_company_around = @companies_around.sample
  end

  # def repositionnement
  #   # @lieu = params[:lieu]
  #   @latitude = params[:lat]
  #   @longitude = params[:long]

  #   @center_marker = [{lat: @latitude, lng: @longitude}]
  #   @companies_around = Company.near([@latitude, @longitude], 15, order: :distance)#.where(validated?: true)
  #   @hash_companies_around_grouped = Company.near([@latitude, @longitude], 15, order: :distance).first(10).group_by(&:category_id)
  #   @companies_around_grouped = @hash_companies_around_grouped.map{|category_id, group| group }.flatten

  #   @companies_around_markers = @companies_around.map do |company|
  #     {
  #       lat: company.latitude,
  #       lng: company.longitude,
  #       # infoWindow: render_to_string(partial: "infoWindow", locals: {company: company}),
  #       # image_url: helpers.asset_url('logo.png'),
  #       icon_url: helpers.asset_url("#{company.category.icon}"),
  #       company_id: company.id
  #     }
  #   end
  #   require_relative 'mapbox-gl/dist/mapbox-gl.css';
  #   respond_to do |format|
  #     format.js { render  action: 'repositionnement.js.erb' }#"repositionnement_matos.js",
  #     format.html
  #   end
  # end

  def admin
    @yesterday = Date.yesterday
    # @yesterday = "2019-04-27"
    @unread_messages_foradmin = Message.unread_by User.find_by(admin: true)
  end

  private

  def set_coordinates
    if(params.has_key?(:lat) && params.has_key?(:long))
      @center_lat = params[:lat]
      @center_long = params[:long]
    else
      @center_lat = current_user.latitude
      @center_long = current_user.longitude
    end
  end


end

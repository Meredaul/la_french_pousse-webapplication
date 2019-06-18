class Company < ApplicationRecord
  has_many :participations, as: :pouss
  has_many :users, through: :participations, as: :pouss

  mount_uploader :photo, PhotoUploader

  geocoded_by :adresse
  after_validation :geocode, if: :will_save_change_to_adresse?
end

class Company < ApplicationRecord
  has_many :participations, as: :pouss
  has_many :users, through: :participations, as: :pouss

  has_many :company_passages, dependent: :destroy

  belongs_to :category

  mount_uploader :photo, PhotoUploader
  mount_uploader :preuve, PreuveUploader

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end


class Company < ApplicationRecord
  # after_create :building_pousse_publication
  # has_one :pousse_publication, dependent: :destroy

  has_many :publications, as: :pouss

  has_many :participations, as: :pouss
  has_many :users, through: :participations, as: :pouss

  has_many :company_passages, dependent: :destroy

  belongs_to :category

  mount_uploader :photo, PhotoUploader

  geocoded_by :address

  validates :nom, presence: true
  validates :presentation, presence: true
  validates :photo, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :category_id, presence: true
  validates :preuve, presence: true

  after_validation :geocode, if: :will_save_change_to_address?


  private

  def building_pousse_publication
    self.pousse_publication = PoussePublication.create
  end
end


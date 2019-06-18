class Participation < ApplicationRecord
  belongs_to :user
  belongs_to :pouss, polymorphic: true #participation.pouss
end

class Pouss < ApplicationRecord
  has_many :fait_partis
  has_many :users, through: :fait_partis
end

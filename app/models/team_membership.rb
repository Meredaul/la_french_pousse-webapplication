class TeamMembership < ApplicationRecord
  belongs_to :user
  belongs_to :pouss, polymorphic: true
end

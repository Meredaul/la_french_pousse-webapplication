class Publication < ApplicationRecord
  after_create :broadcast_publication

  belongs_to :user
  belongs_to :pouss, polymorphic: true
  validates :content, presence: true, allow_blank: false

  def from?(some_user)
    user == some_user
  end

  def broadcast_publication
    ActionCable.server.broadcast("pousse_publication_#{pouss.id}", {
      publication_partial: ApplicationController.renderer.render(
        partial: "publications/publication",
        locals: { publication: self, user_is_publication_author: false, publication_is_major: self.major_publication, author_is_company_admin: self.pouss.users.include?(self.user) }
      ),
      current_user_id: user.id,
      publications_pouss: self.pouss
    })
  end
end

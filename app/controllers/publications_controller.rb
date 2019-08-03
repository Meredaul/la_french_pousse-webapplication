class PublicationsController < ApplicationController
  def create
    @publication = Publication.new(publication_params)
    @company = Company.find(params[:company_id])
    @publication.pouss = @company
    @publication.user = current_user
    @publication.visible = true
    if @publication.save
      respond_to do |format|
        # format.html { redirect_to founder_conversation_path(@founder_conversation) }
        format.js { render action: 'create.js.erb' }
      end
      if @publication.major_publication
        number_of_previous = Publication.all.count - 1
        Publication.all[0...number_of_previous].select(&:visible).each do |publication|
          publication.update(visible: false)
        end
      end
    else
      respond_to do |format|
        # format.html { render "founder_conversations/show" }
        format.js
      end
    end
  end

  def destroy
  end

  private

  def publication_params
    params.require(:publication).permit(:content)
  end
end

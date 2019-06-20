class CompanyPassagesController < ApplicationController
  before_action :set_company, only: [:create]
  before_action :set_company_user_passage, only: [:destroy]

  def create
    if already_linked
      flash[:notice] = "Vous ne pouvez connaître une entreprise plus d'une fois"
    else
      @company.company_passages.create(user: current_user)
    end
    # Handle The Ajax
    if request.xhr?
      head :ok
    else
      redirect_to :authenticated_root
    end
  end

  def destroy
    if @passage
      @passage.destroy
      if request.xhr?
        head :ok
      else
        redirect_to :authenticated_root
      end
    else
      flash[:notice] = "Cette entreprise vous est déjà inconnue"
    end
    # Handle The Ajax
  end

  private

  def set_company_user_passage
    @passage = CompanyPassage.find(params[:id])
  end
  def set_company
    @company = Company.find(params[:company_id])
  end

  def already_linked
    @company.company_passages.find { |passage| passage.user == current_user }
  end
end



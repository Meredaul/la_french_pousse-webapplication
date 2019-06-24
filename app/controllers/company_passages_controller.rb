class CompanyPassagesController < ApplicationController
  before_action :set_company, only: [:create, :destroy]
  before_action :set_company_user_passage, only: [:destroy]

  def create
    @company_passage = CompanyPassage.new(user: current_user, company: @company)
    if already_linked
      flash[:notice] = "Vous ne pouvez connaître une entreprise plus d'une fois"
    else
      respond_to do |format|
        if @company_passage.save
          format.html { redirect_to :authenticated_root, notice: 'Company_passage was successfully created.' }
          # format.json { render :home, status: :created, location: :page }
          format.js { render action: 'create.js.erb' } #
        else
          format.html { render :new }
          # format.json { render json: @company_passage.errors, status: :unprocessable_entity }
          flash[:notice] = "Impossible de sauvegarder"
        end
      end
    end
  end

  def destroy
    respond_to do |format|
      if @passage.destroy
        format.html { redirect_to :authenticated_root, notice: 'Company_passage was successfully destroyed.' }
        # format.json { render :home, status: :created, location: :page }
        format.js { render action: 'destroy.js.erb' } #
      else
        format.html { render :new }
        # format.json { render json: @company_passage.errors, status: :unprocessable_entity }
        flash[:notice] = "Cette entreprise vous est déjà inconnue"
      end
    end
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



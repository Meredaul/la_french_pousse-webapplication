class TeamMembershipsController < ApplicationController
  before_action :set_company, only: [:create]
  before_action :set_company_user_membership, only: [:destroy]

  def index
    @team_memberships = current_user.team_memberships
    @team_companies = @team_memberships.select{|membership| membership.pouss_type == 'Company'}.map(&:pouss)
    # @team_companies = @team_memberships.first.pouss
  end

  def create
    @team_membership = TeamMembership.new(user: current_user, pouss: @company)
    # if already_linked
    #   flash[:notice] = "Vous ne pouvez connaître une entreprise plus d'une fois"
    # else
      respond_to do |format|
        if @team_membership.save
          # format.html { redirect_to :authenticated_root, notice: 'Company_passage was successfully created.' }
          # format.json { render :home, status: :created, location: :page }
          format.js { render action: 'create.js.erb' } #
        else
          # format.html { render :new }
          # format.json { render json: @company_passage.errors, status: :unprocessable_entity }
          flash[:notice] = "Impossible de sauvegarder"
        end
      end
    # end
  end

  def destroy
    @company = @membership.pouss
    respond_to do |format|
      if @membership.destroy
        # format.html { redirect_to :authenticated_root, notice: 'Company_passage was successfully destroyed.' }
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

  def set_company
    @company = Company.find(params[:company_id])
  end
  def set_company_user_membership
    @membership = TeamMembership.find(params[:id])
  end

  def already_linked
    @company.company_passages.find { |passage| passage.user == current_user }
  end
end

class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    respond_to do |format|
      format.js { render action: 'show.js.erb' }
    end
  end

  # GET /companies/new
  def new
      @company = Company.new { @categories = Category.all.map { |category| [category.name, category.id]} }
  end

  # GET /companies/1/edit
  def edit
    @categories = Category.all.map { |category| [category.name, category.id]}
    respond_to do |format|
      format.html
      format.js { render :edit, locals: { company: @company }}
    end
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    # @company.category_id = params[:category_id]
    respond_to do |format|
      if @company.save
        creation_participation = Participation.new(pouss: @company, user: current_user, admin: true)
        creation_participation.save

        format.html { redirect_to :authenticated_root, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :authenticated_root, notice: "Counldn't create Company" }
        # format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to :authenticated_root, notice: 'Company was successfully updated.' }
        # format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        # format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to :authenticated_root, notice: 'Company was successfully destroyed.' }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:nom, :presentation, :email, :address, :latitude, :longitude, :photo, :photo_cache, :remove_photo, :category_id)
    end
end

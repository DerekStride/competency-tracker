class CompetenciesController < ApplicationController
  before_action :set_competency, only: [:show, :edit, :update, :destroy]

  # GET /competencies
  # GET /competencies.json
  def index
    #@competencies = Competency.all
    render json: Competency.all
  end

  # GET /competencies/1
  # GET /competencies/1.json
  def show
  end

  # GET /competencies/new
  def new
    @competency = Competency.new
  end

  # GET /competencies/1/edit
  def edit
  end

  # POST /competencies
  # POST /competencies.json
  def create
    @competency = Competency.new(competency_params)

    respond_to do |format|
      if @competency.save
        format.html { redirect_to @competency, notice: 'Competency was successfully created.' }
        format.json { render :show, status: :created, location: @competency }
      else
        format.html { render :new }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competencies/1
  # PATCH/PUT /competencies/1.json
  def update
    @competency.update(competency_params)
    add_competencies
    respond_to do |format|
      if @competency.save
        format.html { redirect_to @competency, notice: 'Competency was successfully updated.' }
        format.json { render :show, status: :ok, location: @competency }
      else
        format.html { render :edit }
        format.json { render json: @competency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competencies/1
  # DELETE /competencies/1.json
  def destroy
    @competency.destroy
    respond_to do |format|
      format.html { redirect_to competencies_url, notice: 'Competency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competency
      @competency = Competency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competency_params
      params.fetch(:competency, {}).permit(:name)
    end

    def add_competencies
      competency = params.fetch(:competency, {}).permit(competency: :id)
      return unless competency.present?
      @competency.learnables << Learnable.find(competency[:competency][:id])
    end
end

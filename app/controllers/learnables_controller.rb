class LearnablesController < ApplicationController
  before_action :set_learnable, only: [:show, :edit, :update, :destroy]

  # GET /learnables
  # GET /learnables.json
  def index
    @learnables = Learnable.all
  end

  # GET /learnables/1
  # GET /learnables/1.json
  def show
  end

  # GET /learnables/new
  def new
    @learnable = Learnable.new
  end

  # GET /learnables/1/edit
  def edit
    @learnable = Learnable.find(params[:id])
  end

  # POST /learnables
  # POST /learnables.json
  def create
    @learnable = Learnable.new(learnable_params)

    respond_to do |format|
      if @learnable.save
        format.html { redirect_to @learnable, notice: 'Learnable was successfully created.' }
        format.json { render :show, status: :created, location: @learnable }
      else
        format.html { render :new }
        format.json { render json: @learnable.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learnables/1
  # PATCH/PUT /learnables/1.json
  def update
    @learnable.update(learnable_params)
    add_tags
    add_topics
    respond_to do |format|
      if @learnable.save
        format.html { redirect_to @learnable, notice: 'Learnable was successfully updated.' }
        format.json { render :show, status: :ok, location: @learnable }
      else
        format.html { render :edit }
        format.json { render json: @learnable.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learnables/1
  # DELETE /learnables/1.json
  def destroy
    @learnable.destroy
    respond_to do |format|
      format.html { redirect_to learnables_url, notice: 'Learnable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learnable
      @learnable = Learnable.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learnable_params
      params.fetch(:learnables, {}).permit(:name)
    end

    def add_tags
      tags = params.fetch(:learnables, {}).permit(tag: :id)
      return unless tags.present?
      tag = Tag.find(tags[:tag][:id])
      @learnable.tags << tag unless @learnable.tags.include?(tag)
    end

    def add_topics
      topic = params.fetch(:topic, {}).permit(topic: :id)
      return unless topic.present?
      @learnable.competency = Learnable.find(topic[:topic][:id])
    end
end

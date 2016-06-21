class CoversController < ApplicationController
  before_action :set_cover, only: [:show, :edit, :update, :destroy, :competition]
  before_action :authenticate_user!, except: [:index, :show , :competition]
  # GET /covers
  # GET /covers.json
  def index
    @covers = Cover.all
    @users = User.all
  end

  # GET /covers/1
  # GET /covers/1.json
  def show
    @reviews = Review.where(cover_id: @cover.id).order("created_at DESC")
    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.count(:like)
    end
  end
  
  def competition
   # @covers = Cover.all.where(competition: true)
  end

  # GET /covers/new
  def new
    @cover = current_user.covers.build
  end

  # GET /covers/1/edit
  def edit
  end

  # POST /covers
  # POST /covers.json
  def create
    @competitions = Competition.all
    @cover = current_user.covers.build(cover_params)
    @cover.competition_id = @competitions.last.id
@cover.author = current_user.email
    respond_to do |format|
      if @cover.save
        format.html { redirect_to @cover, notice: 'Cover was successfully created.' }
        format.json { render :show, status: :created, location: @cover }
      else
        format.html { render :new }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /covers/1
  # PATCH/PUT /covers/1.json
  def update
    respond_to do |format|
      if @cover.update(cover_params)
        format.html { redirect_to @cover, notice: 'Cover was successfully updated.' }
        format.json { render :show, status: :ok, location: @cover }
      else
        format.html { render :edit }
        format.json { render json: @cover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /covers/1
  # DELETE /covers/1.json
  def destroy
    @cover.destroy
    respond_to do |format|
      format.html { redirect_to covers_url, notice: 'Cover was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cover
       @cover = Cover.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cover_params
      params.require(:cover).permit(:title, :description, :author, :ytlink, :competition)
    end
end

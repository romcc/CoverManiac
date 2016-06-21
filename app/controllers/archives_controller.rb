class ArchivesController < ApplicationController
  def show
    @competitions = Competition.all
    @coverji = Cover.all
    @reviewji = Review.all
  end

  def list
    @competition_id = Competition.find(params[:format])
    @reviews = Review.all
    @avg_review = @reviews.count(:like)
    @coverji = Cover.where(competition_id: @competition_id).order("@avg_review DESC")
  end
  
  private
  def set_competition
       @competition = Competition.find(params[:format])
  end
end

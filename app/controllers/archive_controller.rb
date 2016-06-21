class ArchiveController < ApplicationController
  before_action :authenticate_user!
  def show
    @competitions = Competition.all
    @coverji = Cover.all
    @reviewji = Review.all
  end
  
end

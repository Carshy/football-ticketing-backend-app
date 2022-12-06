class Api::V1::MatchesController < ApplicationController
  def index
    @matches = Match.all
    render json: @matches
  end

  def create
    @match = Match.new(match_params)
      if @match.save
        render json: @match, status: :created
      else
         render json: @match.errors, status: :unprocessable_entity
      end
  end

  private
  
  def match_params
    params.require(:match).permit(:stadium, :location, :home_team, :away_team, :price, :date, :photo, :user_id)
  end
end

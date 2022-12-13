class Api::V1::MatchesController < ApplicationController
  def index
    @matches = Match.all
    render json: @matches
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      render json: { status: 'created' }, status: :created
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @match = Match.find(params[:id])
    if @match.destroy
      render json: { result: 'Match has been deleted' }
    else
      render json: { result: 'Match has not been deleted' }
    end
  end

  private

  def match_params
    params.require(:match).permit(:stadium, :location, :home_team, :away_team, :price, :date, :photo, :user_id)
  end
end

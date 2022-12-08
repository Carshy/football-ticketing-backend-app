class Api::V3::TicketsController < ApplicationController
  def index
    @ticket = Ticket.where(user_id: params[:user_id])
    render json: @ticket
  end

  def new
    @ticket = Ticket.new
    @matches = Match.all
    render json: @matches
    render json: @ticket
  end

  def create
    ticket = Ticket.new(ticket_params)
    ticket.match = Match.find(params[:match_id])
    if ticket.save
      render json: ticket, status: :created
    else
      render json: ticket.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @del_ticket = Ticket.find(params[:id]).destroy
    render json: @del_ticket
  end

  private

  def ticket_params
    params.require(:ticket).permit(:date, :city, :user_id, :match_id, :quantity)
  end
end

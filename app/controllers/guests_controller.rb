class GuestsController < ApplicationController
  def index
    @guests = Guest.where(
      year: params[:year],
      month: params[:month]
    ).order(:last_name, :first_name)
    .includes(:linkedin_profile)
  end
end

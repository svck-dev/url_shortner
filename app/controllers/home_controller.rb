# frozen_string_literal: true

class HomeController < ApplicationController
  def index; end

  def show
    @url = Url.find_by(slug: params[:slug])
    if @url
      redirect_to @url.original, allow_other_host: true
    else
      head 404
    end
  end
end

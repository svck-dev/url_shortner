class Shortner::Enterprise::UrlsController < ApplicationController
  def show
  end

  def new
  end

  def create
  end

  private

  def url_params
    params.require(:url).permit(:original, :slug)
  end
end

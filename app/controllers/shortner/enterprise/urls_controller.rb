class Shortner::Enterprise::UrlsController < ApplicationController
  def show
    @url = Shortner::Enterprise::Urls::ShowTransaction.call(params)
    head 404 if @url.failure?
  end

  def new
    @url = Url.new
  end

  def create
  end

  private

  def url_params
    params.require(:url).permit(:original, :slug)
  end
end

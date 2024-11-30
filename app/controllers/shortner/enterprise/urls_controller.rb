class Shortner::Enterprise::UrlsController < ApplicationController
  def show
    @url = Shortner::Enterprise::Urls::ShowTransaction.call(params)
    head 404 if @url.failure?
  end

  def new
    @url = Url.new
  end

  def create
    url = Shortner::Enterprise::Urls::CreateTransaction.new.call(url_params)
    return redirect_to shortner_enterprise_url_path(url) if url.success?

    render :new, status: :unprocessable_entity, locals: { url: url }
  end

  private

  def url_params
    params.require(:url).permit(:original, :slug)
  end
end

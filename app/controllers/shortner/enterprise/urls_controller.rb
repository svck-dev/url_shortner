class Shortner::Enterprise::UrlsController < ApplicationController
  def show
    @url = Shortner::Enterprise::Urls::ShowTransaction.new.call(id: params[:id])
    return  head 404 if @url.failure?

    render "shortner/simple/urls/show", locals: { url: @url.success }
  end

  def new
    render :new, locals: { url: Url.new }
  end

  def create
    url = Shortner::Enterprise::Urls::CreateTransaction.new.call(url_params)
    return redirect_to shortner_enterprise_url_path(url.success) if url.success?

    render :new, status: :unprocessable_entity, locals: { url: failed_url(url) }
  end

  private

  def failed_url(url)
    new_url = Url.new(url_params)
    url.failure.keys.each do |key|
      url.failure[key].each { |error| new_url.errors.add(key, error) }
    end
    new_url
  end

  def url_params
    params.require(:url).permit(:original, :slug)
  end
end

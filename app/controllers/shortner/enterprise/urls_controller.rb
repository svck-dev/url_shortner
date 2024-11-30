# frozen_string_literal: true

module Shortner
  module Enterprise
    class UrlsController < ApplicationController
      def show
        @url = Shortner::Enterprise::Urls::ShowTransaction.new.call(id: params[:id])
        return head 404 if @url.failure?
        render :show, locals: { url: @url.success }
      end

      def new
        @url = Url.new
        @path = shortner_enterprise_urls_path
      end

      def create
        url = Shortner::Enterprise::Urls::CreateTransaction.new.call(url_params)
        return redirect_to shortner_enterprise_url_path(url.success) if url.success?

        render :new, status: :unprocessable_entity, locals: { url: failed_url(url) }
      end

      private

      def failed_url(url)
        new_url = Url.new(url_params)
        url.failure.each_key do |key|
          url.failure[key].each { |error| new_url.errors.add(key, error) }
        end
        new_url
      end

      def url_params
        params.require(:url).permit(:original, :slug)
      end
    end
  end
end

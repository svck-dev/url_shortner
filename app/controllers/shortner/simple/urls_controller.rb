# frozen_string_literal: true

module Shortner
  module Simple
    class UrlsController < ApplicationController
      def show
        render :show, locals: { url: Url.find(params[:id]) }
      end

      def new
        @url = Url.new
      end

      def create
        @url = Url.new(url_params.merge(source: "simple"))
        if @url.save
          redirect_to shortner_simple_url_path(@url)
        else
          render :new, status: :unprocessable_entity, locals: { url: @url }
        end
      end

      private

      def url_params
        params.require(:url).permit(:original, :slug)
      end
    end
  end
end

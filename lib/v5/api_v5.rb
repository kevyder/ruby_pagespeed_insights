# frozen_string_literal: true

require 'faraday'

module PagespeedInsights
  # Wrapper for Pagespeed Insights API version 5
  class V5
    PAGESPEED_API_URL = 'https://www.googleapis.com/pagespeedonline/v5/runPagespeed'
    attr_reader :url, :key, :strategy, :categories, :status, :headers, :body

    def initialize(url:, key:, strategy: nil, categories: [])
      @base_url = PAGESPEED_API_URL
      @url = url
      @key = key
      @strategy = strategy
      @categories = categories
    end

    def results(fields: nil, pretty_print: true)
      uri_params = uri_params_generator(fields, pretty_print)
      make_request(uri_params)
    end

    private

    def parse_categories
      @categories&.join(',')
    end

    def uri_params_generator(fields, pretty_print)
      uri_params = { key: @key, url: @url, pretty_print: pretty_print }
      uri_params[:strategy] = @strategy if @strategy
      uri_params[:category] = parse_categories if @categories
      uri_params[:fields] = fields if fields
      uri_params
    end

    def make_request(uri_params)
      headers = { 'Accept': 'application/json' }
      response = Faraday.get(@base_url, uri_params, headers)
      @status = response.status
      @headers = response.headers
      @body = response.body
      self
    rescue StandardError => error
      { error_message: error.to_s }
    end
  end
end

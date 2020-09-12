# frozen_string_literal: true

RSpec.describe PagespeedInsights::V5 do
  context 'when has an invalid api key' do
    before(:context) do
      request = PagespeedInsights::V5.new(
        url: ENV['TEST_SITE'],
        key: ENV['FAKE_API_KEY'],
        strategy: 'mobile'
      )
      @response = request.results
    end

    it 'must be status 400' do
      expect(@response.status).to eq 400
    end
  end

  context 'when has a valid api key' do
    before(:context) do
      request = PagespeedInsights::V5.new(
        url: ENV['TEST_SITE'],
        key: ENV['API_KEY'],
        strategy: 'desktop'
      )
      @response = request.results
    end

    it 'must be status 200' do
      expect(@response.status).to eq 200
    end
  end

  context 'when has an invalid strategy' do
    before(:context) do
      request = PagespeedInsights::V5.new(
        url: ENV['TEST_SITE'],
        key: ENV['API_KEY'],
        strategy: 'fake'
      )
      @response = request.results
    end

    it 'must be status 400' do
      expect(@response.status).to eq 400
    end
  end

  context 'when has an invalid category' do
    before(:context) do
      request = PagespeedInsights::V5.new(
        url: ENV['TEST_SITE'],
        key: ENV['API_KEY'],
        strategy: 'desktop',
        categories: ['fake']
      )
      @response = request.results
    end

    it 'must be status 200' do
      expect(@response.status).to eq 200
    end
  end
end

RSpec.describe PagespeedInsights do
  it "has a version number" do
    expect(PagespeedInsights::VERSION).not_to be nil
  end

  it "has API v5 class wrapper" do
    expect(PagespeedInsights::V5).not_to be nil
  end
end

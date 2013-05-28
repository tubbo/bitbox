Rails.application.config.generators do |g|
  g.test_framework :rspec, fixtures: true, fixture_location: "spec/fixtures"
end

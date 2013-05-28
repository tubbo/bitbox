Rails.application.config.generators do |g|
  g.template_engine :haml
  g.test_framework :rspec, fixtures: true, fixture_location: "spec/fixtures"
end

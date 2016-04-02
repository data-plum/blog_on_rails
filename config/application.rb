require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp
  class Application < Rails::Application

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif *.svg)

    # Include the authenticity token in remote forms.
    config.action_view.embed_authenticity_token_in_remote_forms = true

    # Generate starter files for application’s test suite
    config.generators do |g|
  		g.test_framework :rspec,
		    fixtures: true,
		    view_specs: true,
		    helper_specs: true,
		    routing_specs: true,
		    controller_specs: true,
		    request_specs: true
  		g.fixture_replacement :factory_girl, dir: "spec/factories"
	end
  end
end

# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:5100', 'pennylane-assignment-damp-resonance-9200-ancient-dew-7729.fly.dev', 'pennylane-assignment.fly.dev'

    resource '*',
             headers: :any,
             methods: [:get, :post, :patch, :put, :delete, :options, :head],
             credentials: true
  end
end
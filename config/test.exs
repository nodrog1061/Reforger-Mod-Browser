import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :workshop_browser, WorkshopBrowserWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "3w6pCNYq3f9WanBI3OC/BWi+27klx+BxcY41uPHwnmhFY4nzQOB1bHajaTEolWdd",
  server: false

# In test we don't send emails.
config :workshop_browser, WorkshopBrowser.Mailer,
  adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

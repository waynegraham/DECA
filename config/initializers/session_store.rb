# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_deca_session',
  :secret      => '563458d8d4daa38c7b1dcd0c52cc4841ad337102067e7d685d50723de817d5583d164efae7c6430e2e5136046022d383d2c38eeccb337f9ce4b68e71456b19bf'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

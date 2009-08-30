# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_deca_session',
  :secret      => '71254dc77651c799e29b23b295ddc30bb622805b56285385457ad0193581564b49e588d6b1069829af5748ebb0d16a9c3d2e29cecfa92aaeca1d80374791e12b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

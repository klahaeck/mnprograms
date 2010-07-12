# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mnprograms_session',
  :secret      => 'e2fc4db5e39ba37145ef25c16e3dd4b4fb9051db741990ad0e231608fa75b7c93eb61744ea52839ab273dae08e9b030b9af4c03f9a0efe8ca8d72a1e7d6f5201'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

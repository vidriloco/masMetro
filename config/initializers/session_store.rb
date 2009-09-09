# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_masMetro_session',
  :secret      => '395ef805fc8a53b0922ef1d019256beef950efb0bedb53dae2d0791d086a0a0f93139a0281eed1919c256fa16407a9adae32ca05b5dc0c240f5dd9e9e6d2a159'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store

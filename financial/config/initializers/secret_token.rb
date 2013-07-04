# encoding: utf-8

def read_secret_token
  secret_token = YAML.load_file('config/secret_token.yml')[Rails.env]
  raise if secret_token.blank?
  secret_token
rescue => exception
  puts '** Error on load "config/secret_token.yml"'
  raise exception
end

Financial::Application.config.secret_key_base = read_secret_token

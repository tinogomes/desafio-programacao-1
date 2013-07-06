# encoding: utf-8

if ENV['SECRET_TOKEN'].nil? || ENV['SECRET_TOKEN'].empty?
  warn('SECRET_TOKEN is not defined. Try `export SECRET_TOKEN=$(rake secret)`')
  exit 1
end

Financial::Application.config.secret_key_base = ENV['SECRET_TOKEN']

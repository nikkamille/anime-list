require 'pry'
require 'uri'
require 'net/http'
require 'openssl'
require 'json'
require 'httparty'

require_relative './anime_list/version'
require_relative './ApiManager'
require_relative './anime'
require_relative './cli'

module AnimeList
  class Error < StandardError; end
  # Your code goes here...
end

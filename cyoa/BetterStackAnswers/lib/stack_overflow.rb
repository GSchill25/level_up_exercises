require 'httparty'
require 'json'

class StackOverflow
	attr_accessor :answers

	include HTTParty

	def initialize
		@answers = {}
	end

	def stack_answers
		@answers = HTTParty.get("https://api.stackexchange.com/2.2/answers?site=stackoverflow&filter=!0XMmcqBN(UG(wzxn)O)rKgCkm")
	end
end

require 'json'
require 'open-uri'

class StackAnswers
end


class AnswerParser
	def initialize
		@objects = {}
	end

	def stack_overflow_answers
    open('https://api.stackexchange.com//2.2/answers?fromdate=1401494400&todate=1432857600&order=desc&sort=activity&site=stackoverflow&filter=!b0OfNcJ.j0Y4rL') {|f|
    	f.each_line {|line| p line}
  	}
  end
end


ap = AnswerParser.new
ap.stack_overflow_answers
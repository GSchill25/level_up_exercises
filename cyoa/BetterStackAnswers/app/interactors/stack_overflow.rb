require 'httparty'

class StackOverflow
  attr_accessor :answers, :questions, :answer_ids

  include HTTParty

  SO_Q_VARS = %w(accepted_answer_id question_id up_vote_count link
                 body tags title is_answered answer_count)

  SO_A_VARS = %w(answer_id question_id is_accepted up_vote_count link body)

  def initialize
    @answers = {}
    @questions = {}
    @answer_ids = ""
  end

  def stack_answers
    @answer_ids = @answer_ids[0..@answer_ids.length - 2]
    @answers = HTTParty.get("https://api.stackexchange.com/2.2/answers/"\
                            "#{@answer_ids}?pagesize=100&order=desc&sort"\
                            "=activity&site=stackoverflow&filter=!)5lu_u"\
                            "JvJu*29XuDV862WD9kVmja")
  end

  def create_answers_from_json
    raise "No answer ids" if @answer_ids.empty?
    @answers["items"].each do |a|
      question = Question.where("question_id = ?", a["question_id"])[0]
      so = stack_overflow_attributes(SO_A_VARS, a)
      so["question_id"] = question.id
      Answer.create(so)
    end
  end

  def stack_overflow_attributes(attr_list, obj)
    attr_list.inject({}) do |att, val|
      att[val.to_sym] = obj[val]
      att
    end
  end

  def stack_questions
    time = 1.week.ago.to_time.to_i
    @questions = HTTParty.get("https://api.stackexchange.com/2.2/questions?"\
                              "pagesize=100&todate=#{time}&order=desc&sort="\
                              "activity&tagged=ruby&site=stackoverflow&filt"\
                              "er=!BL6SJ7EwsWfFXwoLNU7IsOZ938AjAp")
  end

  def create_questions_from_json
    @questions["items"].each do |q|
      @answer_ids += "#{q[SO_Q_VARS[0]]};" unless q[SO_Q_VARS[0]].nil?
      so = stack_overflow_attributes(SO_Q_VARS, q)
      so["tags"] = so["tags"].join(",") unless so["tags"].nil?
      Question.create(so)
    end
  end
end

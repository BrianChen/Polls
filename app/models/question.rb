class Question < ActiveRecord::Base
  validates :poll_id, presence: true
  validates :text, presence: true

  def results
    query_results = self.responses.includes(:answer_choice)
    result = Hash.new(0)
    query_results.each do |row|
      result[row.answer_choice.text] += 1
    end
    result
  end

  has_many(
    :answer_choices,
    class_name: :AnswerChoice,
    primary_key: :id,
    foreign_key: :question_id
  )

  belongs_to(
    :poll,
    class_name: :Poll,
    primary_key: :id,
    foreign_key: :poll_id
  )

  has_many(
  :responses,
  through: :answer_choices,
  source: :responses
  )


end

class Response < ActiveRecord::Base
  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :not_duplicate_response

  def not_duplicate_response
    if respondent_already_answered?
      self.errors[:user_id] << "Can not answer again"
    end
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def sibling_responses
    question.responses.where.not(id: self.id)
  end

    belongs_to(
      :respondent,
      class_name: :User,
      primary_key: :id,
      foreign_key: :user_id
    )

    belongs_to(
      :answer_choice,
      class_name: :AnswerChoice,
      primary_key: :id,
      foreign_key: :answer_choice_id
    )

    has_one(
      :question,
      through: :answer_choice,
      source: :question
    )

    has_one(
      :poll,
      through: :answer_choice,
      source: :poll
    )

end

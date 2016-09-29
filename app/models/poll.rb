class Poll < ActiveRecord::Base
  validates :user_id, presence: true
  validates :title, presence: true

  belongs_to(
    :author,
    class_name: User,
    foreign_key: :user_id,
    primary_key: :id
  )

  has_many(
    :questions,
    class_name: :Question,
    primary_key: :id,
    foreign_key: :poll_id
  )
end

class Sub < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    # validates :moderator, allow_nil: true

    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User

    has_many :posts
end

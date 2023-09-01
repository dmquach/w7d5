class Sub < ApplicationRecord
    validates :title, :moderator, presence: true
    validates :title, uniqueness: true

    belongs_to :moderator,
        foreign_key: :user_id,
        class_name: :User

    has_many :posts
end

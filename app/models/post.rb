class Post < ApplicationRecord
    belongs_to :user

    # user_id, title, content
end
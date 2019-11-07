class Post < ActiveRecord::Base

    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :title, presence: true

end

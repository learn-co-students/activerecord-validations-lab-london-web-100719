class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbait?

    def is_clickbait?
        clickbait_array = [
            "Won't Believe",
            "Secret",
            "Top",
            "Guess"
        ]

        clickbaitless = false

        clickbait_array.each do |clickbait|
            if title
                if title.include?(clickbait)
                    clickbaitless = true
                end
            end
        end

        unless clickbaitless
            errors.add(:title, "must be clickbait") 
        end
    end
end

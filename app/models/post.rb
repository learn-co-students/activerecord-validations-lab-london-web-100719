class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :is_clickbait?

    def is_clickbait?
        clickbait = [
            "Won't Believe",
            "Secret",
            "Top",
            "Guess"
        ]
        clickbaitless = false

        clickbait.each do |cb|
            if title
                if title.include?(cb)
                    clickbaitless = true
                end
            end
        end
        unless clickbaitless
            errors.add(:title, "must be clickbait")
        end
    end
end

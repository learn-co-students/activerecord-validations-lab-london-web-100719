class Post < ActiveRecord::Base

    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction),
        message: "%{value} can only be fiction and non-fiction" }

    validate :non_clickbait

    def non_clickbait
        if self.title.class == String

            title_array = self.title.split(" ")
            cb_array = ["Won't", "Believe", "Secret", "Top", "Guess"]
    
            if (title_array & cb_array).size == 0
    
                errors.add(:title, "needs to be clickbait")
                
            end
            
        end


    end

end

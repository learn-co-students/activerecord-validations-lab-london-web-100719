class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  
  validate :sufficiently_clickbait_y

  def sufficiently_clickbait_y
   
    if title.nil? || !title.include?("Won't Believe" || "Secret" || "Top #{/[0-9]*/}" || "Guess")
      errors.add(:title, "The title is not click bait-y enough, be more of an asshole")
    end
  end

end

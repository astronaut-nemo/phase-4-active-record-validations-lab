class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_clickbaity

    # Custom validations
    def is_clickbaity
        # byebug
        if [/Won't Believe/i, /Secret/i, /Top/i, /Guess/i].none?{|clickbait| clickbait.match title}
            errors.add(:title, "Not clickbait-y enough!")
        end
    end
end

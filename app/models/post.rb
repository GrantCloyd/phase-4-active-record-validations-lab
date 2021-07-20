require 'active_support'

class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :is_clickbaity

    def is_clickbaity
       click_bait_words = ["Won't Believe", "Secret", "Top Number", "Guess"]
       if title != nil && click_bait_words.any? {|word| title.match(word)} == false
          errors.add(:title, "Not a clickbaity title")
       end
    end
end

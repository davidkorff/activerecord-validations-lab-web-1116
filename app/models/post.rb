class Post < ActiveRecord::Base
	validates :title, presence: true
	validates :content, length: {minimum: 250}
	validates :summary, length: {maximum: 250}
	validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
	validate :clickbait



  def clickbait
    biat = []
    clickbait = ["won't believe", "secret", "top", "guess"]
    clickbait.each do |term|
      if title != nil
        if title.downcase.include? (term)
          biat << term
        end
      end
    end
    if biat.length == 0
      errors.add(:title)
    end
  end

end

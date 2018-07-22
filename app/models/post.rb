
class ClickbaitCheck < ActiveModel::Validator
  def validate(post)
    if post.title
      unless post.title.include? ("Won't Believe" || "Secret" || "Top [number]" || "Guess" )
        post.errors[:title] << "Not clickbait-y enough"
      end
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates_with ClickbaitCheck
end

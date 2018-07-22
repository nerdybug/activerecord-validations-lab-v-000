class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
  validates_with ClickbaitCheck
end

class ClickbaitCheck < ActiveRecord::Validator
  def validate(record)
    unless record.title.include? ("Won't Believe" || "Secret" || "Top [number]" || "Guess" )
    end
  end
end

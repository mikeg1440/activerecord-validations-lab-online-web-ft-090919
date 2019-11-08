
class TitleValidator < ActiveModel::Validator

  def validate(record)
    unless record.title && is_clickbaity?(record.title)
      record.errors.add :title, "The title is not clickbaity enough"
    end
  end


  private

  CLICKBAIT_PATTERNS = ["Won't Believe", "Secret", "Top [0-9]","Guess"]

  # check to see if any CLICKBAIT_PATTERNS are a match the title attribute
  def is_clickbaity?(attribute)
    CLICKBAIT_PATTERNS.any? do |pattern|
      if attribute.match?(/#{pattern}/)
        return true
      end
    end
    # if not pattern matches return false
    false
  end

end

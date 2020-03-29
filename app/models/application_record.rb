class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.searchable_language
    "swedish"
  end

  def self.initials(text)
    initials = ""
    if text
      initials = (text.split - ["AB"]).map(&:first).join.strip
    end
    if initials == ""
      initials = "?"
    end
    initials.upcase
  end
end

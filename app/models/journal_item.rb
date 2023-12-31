class JournalItem < ApplicationRecord
  has_many_attached :pictures

  scope :search, ->(query) {
    return if query.blank?
    where(arel_table[:body].matches("%#{query}%"))
  }

  def pictures_as_thumbnail(pic)
    pic.variant(resize_to_limit: [800, 800]).processed
  end
end

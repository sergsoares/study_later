class Link < ApplicationRecord
  belongs_to :user
  has_one :category

  def self.per_page
    5
  end

end

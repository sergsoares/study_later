class Link < ApplicationRecord
  belongs_to :user
  has_one :category

  validates :link, presence: true, :format => URI::regexp(%w(http https))
  
  def self.per_page
    5
  end

end

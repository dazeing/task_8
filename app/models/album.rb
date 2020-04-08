class Album < ApplicationRecord
  belongs_to :artist
  belongs_to :group
  belongs_to :genre
  has_many :songs, dependent: :destroy
  validates :name, presence: true, length: { minimum: 3 }

  before_create :capitalize_name

  private
    def capitalize_name
      self.name = name.downcase.capitalize
    end
end

class Song < ApplicationRecord
  belongs_to :album
  validates :name, presence: true, length: { minimum: 3 }

  before_create :capitalize_name

  private
    def capitalize_name
      self.name = name.downcase.capitalize
    end
end

class Artist < ApplicationRecord
    has_and_belongs_to_many :groups
    has_many :albums, dependent: :destroy
    validates :name, presence: true, length: { minimum: 3 }

    before_create :capitalize_name

    private
      def capitalize_name
        self.name = name.downcase.capitalize
      end
end

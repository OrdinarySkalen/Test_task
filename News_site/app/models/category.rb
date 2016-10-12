class Category < ActiveRecord::Base
  has_many :articles, dependent: :destroy
  validates :value, presence: true,
                    length: { minimum: 3 }
end

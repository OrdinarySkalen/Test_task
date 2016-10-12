class Tag < ActiveRecord::Base
  has_and_belongs_to_many :articles
  validates :value, presence: true,
                    length: { minimum: 3 }
  def t_value
    "#{tag.value}"
  end
end

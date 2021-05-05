class Study < ApplicationRecord

    validates :name, presence: true
    validates_presence_of  :drug
    validates :phase, numericality: { less_than_or_equal_to: 5 }
    validates :age_limit, numericality: { greater_than: 7 }

end

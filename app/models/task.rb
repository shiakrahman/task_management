class Task < ApplicationRecord
  
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 10, maximum: 100 }
  validates :due_date, presence: true
end


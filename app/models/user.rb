class User < ApplicationRecord
    has_secure_password
    has_many :tasks, dependent: :destroy
  
    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password, presence: true
    validates :phone, presence: true, uniqueness: true, length: { minimum: 10 }
end
  
  

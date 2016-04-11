class User < ActiveRecord::Base
  before_save { self.email = self.email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :age, numericality: { greater_than_or_equal_to: 0 }, on: :update
  validates :area, length: { maximum: 20 }, on: :update
  validates :body, length: { maximum: 100 } , on: :update
  has_secure_password
end

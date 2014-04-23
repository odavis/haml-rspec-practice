class User < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 50}

  validates :password, length: {minimum: 5}
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: {case_sensitive: false}

  before_save :downcase_email
# before_save { self.email = email.downcase }

  private
    def downcase_email
      self.email = email.downcase
    end
end

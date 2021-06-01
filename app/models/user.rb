class User < ActiveRecord::Base
  validates :email, :name, presence: true
  validates :email, uniqueness: { :case_sensitive => false }
  validates :password, length: { minimum: 4, too_short: "must be at least 4 characters" }

  has_secure_password

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end


end

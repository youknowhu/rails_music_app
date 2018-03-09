class User < ApplicationRecord
  validates :email, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }
  # User::generate_session_token, User#reset_session_token! and User#ensure_session_token.
  after_initialize :ensure_session_token

  has_many :notes
  attr_reader :password

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    user && user.valid_password?(password) ? user : nil

  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)

  end

  def valid_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
  end

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end

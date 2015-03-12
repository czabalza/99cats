class User < ActiveRecord::Base
  validates :user_name, :password_digest, :session_token, presence: true
  validates :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }
  after_initialize :ensure_session_token
  mount_uploader :picture, PictureUploader
  has_many :cats
  has_many :cat_rental_requests
  attr_accessor :password

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by_user_name(user_name)
    return user if user.is_password?(password)
  end

  private
  def ensure_session_token
   self.session_token ||= self.class.generate_session_token
  end
end

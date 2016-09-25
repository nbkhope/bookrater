class User < ActiveRecord::Base

  has_secure_password

  has_many :favorites
  has_many :books, through: :favorites

  has_many :likes

  validates :auth_token, uniqueness: true

  # devise :database_authenticable, :registerable,
  # 			 :recoverable, :rememberable, :trackable, :validatable

  before_create :generate_auth_token

  validates :password, length: { minimum: 6 }

  def self.new_token
    SecureRandom.hex # or: urlsafe_base64
  end

  private

  # Returns true if the given token matches the digest
  def authenticated?(attribute, token)
    digest = self.send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Generates a unique authentication token
  def generate_auth_token
  	begin
  		self.auth_token = User.new_token
  	end while self.class.exists?(auth_token: auth_token)
  end
end

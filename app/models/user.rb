class User
  include Mongoid::Document
  field :full_name, type: String
  field :username, type: String
  field :email, type: String
  field :password_hash, type: String
  field :password_salt, type: String

  has_one :role

  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :email
  validates_uniqueness_of :email

  def authenticate(email, password)
    # user = find_by_email(email)
    user = User.find_by email: email
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end

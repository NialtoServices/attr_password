# The password attribute module
#
module AttrPassword
  class << self
    # Require dependencies
    #
    # Example:
    #   >> AttrPassword.require!
    #   => nil
    #
    def require!
      require 'bcrypt'
      require 'unix_crypt'

      require 'attr_password/constants'
      require 'attr_password/adapters'

      require 'attr_password/bcrypt'
      require 'attr_password/sha512'
      require 'attr_password/sha256'
      require 'attr_password/md5'
      require 'attr_password/des'
    end
  end

  # Add the password functionality
  #
  # Arguments:
  #   algorithm: (Symbol) (Default :bcrypt)
  #
  # Example:
  #   >> class Test
  #   >>   has_password :bcrypt
  #   >> end
  #
  def has_password(algorithm = :bcrypt)
    # Get the backend crypt class
    backend = case algorithm
    when :bcrypt
      AttrPassword::BCrypt.new
    when :sha512
      AttrPassword::SHA512.new
    when :sha256
      AttrPassword::SHA256.new
    when :md5
      AttrPassword::MD5.new
    when :des
      AttrPassword::DES.new
    else
      return false
    end

    define_method("password=") do |password|
      # Get the adapter
      adapter = AttrPassword::Adapters.for(self)

      # Get the crypted password
      crypted_password = password ? backend.crypt_password(password) : nil

      # Set the password hash
      adapter.write_attribute(:crypted_password, crypted_password)
    end

    define_method("valid_password?") do |password|
      # Ensure the password is not nil
      return false if password.nil?

      # Get the adapter
      adapter = AttrPassword::Adapters.for(self)

      # Check if the password is valid
      backend.validate_password(password, crypted_password)
    end

    true
  end
end

# Require dependencies
#
AttrPassword.require!

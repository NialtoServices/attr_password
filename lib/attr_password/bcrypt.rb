module AttrPassword
  # The BCrypt class
  #
  class BCrypt
    # Crypt the password
    #
    # Arguments:
    #   password: (String)
    #
    # Example:
    #   >> backend.crypt_password("P@ssw0rd")
    #   => "$2a$10$Ou0no1.WrBtZm2rF4Te7getynnENc2wESKZDLyJTmqnSPV1TEXZ8y"
    #
    def crypt_password(password)
      # Get the BCrypt password
      bcrypt = ::BCrypt::Password.create(password)

      # Get the BCrypt string
      bcrypt.to_s
    end

    # Check if a password is valid
    #
    # Arguments:
    #   password_hash: (String)
    #   password: (String)
    #
    # Example:
    #   >> backend.crypt_password("P@ssw0rd", "$2a$10$Ou0no1.WrBtZm2rF4Te7getynnENc2wESKZDLyJTmqnSPV1TEXZ8y")
    #   => true
    #
    def validate_password(password, password_hash)
      begin
        # Load the BCrypt password hash
        bcrypt = ::BCrypt::Password.new(password_hash)

        # Check if the password is valid
        bcrypt == password
      rescue => e
        return false
      end
    end
  end
end

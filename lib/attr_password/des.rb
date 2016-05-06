module AttrPassword
  # The DES class
  #
  class DES
    # Crypt the password
    #
    # Arguments:
    #   password: (String)
    #
    # Example:
    #   >> backend.crypt_password("P@ssw0rd")
    #   => "5F9dBJsU0KiKQ"
    #
    def crypt_password(password)
      # Get the DES crypt password
      UnixCrypt::DES.build(password)
    end

    # Check if a password is valid
    #
    # Arguments:
    #   password_hash: (String)
    #   password: (String)
    #
    # Example:
    #   >> backend.crypt_password("P@ssw0rd", "5F9dBJsU0KiKQ")
    #   => true
    #
    def validate_password(password, password_hash)
      # Ensure the password is set
      return false unless password

      # Ensure the password hash is set
      return false unless password_hash

      # Check if the password is valid
      UnixCrypt.valid?(password, password_hash)
    end
  end
end

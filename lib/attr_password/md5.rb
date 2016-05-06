module AttrPassword
  # The MD5 class
  #
  class MD5
    # Crypt the password
    #
    # Arguments:
    #   password: (String)
    #
    # Example:
    #   >> backend.crypt_password("P@ssw0rd")
    #   => "$1$zKiCUMIJ$9w79XD.6T1tQZ3xF2ztcK."
    #
    def crypt_password(password)
      # Get the MD5 crypt password
      UnixCrypt::MD5.build(password)
    end

    # Check if a password is valid
    #
    # Arguments:
    #   password_hash: (String)
    #   password: (String)
    #
    # Example:
    #   >> backend.crypt_password("P@ssw0rd", "$1$zKiCUMIJ$9w79XD.6T1tQZ3xF2ztcK.")
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

module AttrPassword
  # The SHA256 class
  #
  class SHA256
    # Crypt the password
    #
    # Arguments:
    #   password: (String)
    #
    # Example:
    #   >> backend.crypt_password("P@ssw0rd")
    #   => "$5$1zQaVXCHYfnNQALN$BKZbxVPaCnhgigMSLDMlmxSLPZHY1HBOEypeL3ZHfbD"
    #
    def crypt_password(password)
      # Get the SHA256 crypt password
      UnixCrypt::SHA256.build(password)
    end

    # Check if a password is valid
    #
    # Arguments:
    #   password_hash: (String)
    #   password: (String)
    #
    # Example:
    #   >> backend.crypt_password("P@ssw0rd", "$5$1zQaVXCHYfnNQALN$BKZbxVPaCnhgigMSLDMlmxSLPZHY1HBOEypeL3ZHfbD")
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

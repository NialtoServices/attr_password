module AttrPassword
  # The SHA512 class
  #
  class SHA512
    # Crypt the password
    #
    # Arguments:
    #   password: (String)
    #
    # Example:
    #   >> backend.crypt_password("P@ssw0rd")
    #   => "$6$x7NCbuLU4Bdr2SrU$qb.a9XG7AFszgj0qDO66Xce5pFI5eRcGhAyIrmylEuhYHIsyoCk6DKBOKW/eleMSjBuY10kgtS2zvicwLxZj91"
    #
    def crypt_password(password)
      # Get the SHA512 crypt password
      UnixCrypt::SHA512.build(password)
    end

    # Check if a password is valid
    #
    # Arguments:
    #   password_hash: (String)
    #   password: (String)
    #
    # Example:
    #   >> backend.crypt_password("P@ssw0rd", "$6$x7NCbuLU4Bdr2SrU$qb.a9XG7AFszgj0qDO66Xce5pFI5eRcGhAyIrmylEuhYHIsyoCk6DKBOKW/eleMSjBuY10kgtS2zvicwLxZj91")
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

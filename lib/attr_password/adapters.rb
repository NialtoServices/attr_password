module AttrPassword
  # This module contains the adapters
  #
  module Adapters
    class << self
      # Require the adapters
      #
      # Example:
      #   >> AttrPassword::Adapters.require!
      #   => true
      #
      def require!
        require 'attr_password/adapters/base'

        # Get the glob for the adapters directory
        adapters_glob = File.expand_path('../adapters/**/*.rb', __FILE__)

        # Loop over each adapter file
        Dir.glob(adapters_glob).each do |adapter|
          # Require the adapter file
          require(adapter)
        end
      end

      # Find the best adapter for an object
      #
      # Arguments:
      #   object: (Object)
      #
      # Example:
      #   >> AttrPassword::Adapters.for(object)
      #   => #<AttrPassword::Adapters::Ruby:0x00000000000000>
      #
      def for(object)
        # The list of all adapters
        adapters = [
          AttrPassword::Adapters::ActiveRecord,
          AttrPassword::Adapters::Ruby
        ]

        # Loop over each adapter
        adapters.each do |klass|
          # Create a new instance of the adapter
          adapter = klass.new(object)

          # Ensure the adapter is available
          next unless adapter.available?

          return adapter
        end

        nil
      end
    end
  end
end

# Require the adapters
#
AttrPassword::Adapters.require!

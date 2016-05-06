module AttrPassword
  module Adapters
    # The base adapter
    #
    class Base
      # The object the adapter relates to
      #
      attr_reader :object

      # Create a new instance of this adapter
      #
      # Example:
      #   >> AttrPassword::Adapters::Base.new(object)
      #   => #<AttrPassword::Adapters::Base:0x00000000000000>
      #
      def initialize(object)
        # Ensure the object exists
        unless object
          raise 'The object property cannot be nil.'
        end

        # Store the object
        @object = object
      end

      # Check if this adapter can be used for the object
      #
      # Example:
      #   >> adapter.available?
      #   => true
      #
      def available?
        true
      end

      # Read an attribute
      #
      # Example:
      #   >> adapter.read_attribute(:hello_world)
      #   => "Hello, World!"
      #
      def read_attribute(attribute, value)
        nil
      end

      # Write an attribute
      #
      # Example:
      #   >> adapter.write_attribute(:hello_world, "Hello, World!")
      #   => true
      #
      def write_attribute(attribute, value)
        false
      end
    end
  end
end

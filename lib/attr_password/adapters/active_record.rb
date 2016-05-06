module AttrPassword
  module Adapters
    # The ActiveRecord adapter
    #
    class ActiveRecord < Base
      class << self
        # Attempt to inject the AttrPassword class into ActiveRecord::Base
        #
        # Example:
        #   >> AttrPassword::Adapters::ActiveRecord.inject!
        #   => nil
        #
        def inject!
          # Ensure the ActiveRecord::Base class is defined
          return false unless defined?(::ActiveRecord::Base)

          # Make the ActiveRecord::Base class extend the AttrPassword class
          ::ActiveRecord::Base.send(:extend, AttrPassword)

          true
        end
      end

      # Check if this adapter can be used for the object
      #
      # Example:
      #   >> adapter.available?
      #   => true
      #
      def available?
        # Ensure the ActiveRecord::Base class is defined
        return false unless defined?(::ActiveRecord::Base)

        # Check if the object inherits from ActiveRecord::Base
        @object.class.ancestors.include?(::ActiveRecord::Base)
      end

      # Read an attribute
      #
      # Example:
      #   >> adapter.read_attribute(:hello_world)
      #   => "Hello, World!"
      #
      def read_attribute(attribute)
        @object.send(:read_attribute, attribute.to_sym)
      end

      # Write an attribute
      #
      # Example:
      #   >> adapter.write_attribute(:hello_world, "Hello, World!")
      #   => true
      #
      def write_attribute(attribute, value)
        @object.send(:write_attribute, attribute, value)
      end
    end
  end
end

# Attempt to inject the AttrPassword class into ActiveRecord::Base
#
AttrPassword::Adapters::ActiveRecord.inject!

module AttrPassword
  module Adapters
    # The ActiveRecord adapter
    #
    class Ruby < Base
      # Read an attribute
      #
      # Example:
      #   >> adapter.read_attribute(:hello_world)
      #   => "Hello, World!"
      #
      def read_attribute(attribute)
        @object.instance_variable_get("@#{attribute}")
      end

      # Write an attribute
      #
      # Example:
      #   >> adapter.write_attribute(:hello_world, "Hello, World!")
      #   => true
      #
      def write_attribute(attribute, value)
        @object.instance_variable_set("@#{attribute}", value)
      end
    end
  end
end

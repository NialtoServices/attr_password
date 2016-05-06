module AttrPassword
  module RSpec
    module Matchers
      module Version
        extend ::RSpec::Matchers::DSL

        matcher :be_semantic_version do
          match do |string|
            next false if "0.0.0" == string

            string =~ /^[0-9]+\.[0-9]+\.[0-9]+$/
          end

          failure_message do |string|
            "%s is not a semantic version" % string
          end
        end
      end
    end
  end
end

# Monkey patch for Ruby 3.4 compatibility with Liquid gem
if RUBY_VERSION >= "3.2"
  require 'liquid'
  
  module Liquid
    class Variable
      private
      
      # Replace the taint_check method to work with Ruby 3.2+
      def taint_check(obj, name = nil)
        # In Ruby 3.2+, taint functionality was removed
        # This method now just returns without doing anything
        return
      end
    end
  end
end
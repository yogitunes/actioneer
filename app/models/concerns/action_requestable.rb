module Actioneer
  module Requestable
    extend ActiveSupport::Concern
    included do
      def self.requests_action symbol
        puts "I (#{ self }) request #{ symbol.to_s }"
      end
    end
  end
end

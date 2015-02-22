module Requestable
  extend ActiveSupport::Concern
  included do
    def request(type,creator)
      ActionRequest.create(target: self, creator: creator, action_type: type.to_s)
    end
    
    def self.requests_action symbol
      puts "request_#{symbol.to_s}"
      class_eval %Q{
        def request_#{ symbol.to_s }(creator)
          request(:#{ symbol.to_s },creator)
        end
      }
    end
  end
end

class ActionStatus < ActiveRecord::Base
  belongs_to :request, class_name: 'ActionRequest', foreign_key: 'request_id'
end

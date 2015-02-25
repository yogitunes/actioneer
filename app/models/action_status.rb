class ActionStatus < ActiveRecord::Base
  belongs_to :request
  belongs_to :user, polymorphic: true
end

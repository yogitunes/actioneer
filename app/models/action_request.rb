class ActionRequest < ActiveRecord::Base
  belongs_to :target, polymorphic: true
  belongs_to :creator, polymorphic: true
  
  has_many :statuses, class_name: 'ActionStatus', foreign_key: 'request_id'
  
  validate :action_type_exists

  def action_type_exists
    errors.add(:action_type,'does not exist') unless (action_class rescue false)
  end

  def type
    attributes['action_type']
  end
  
  def action_class
    "#{type.camelize}Action".constantize
  end
  
  def available_actions
    action_class.actions
  end

  def perform action
    action_class.perform(action,self)
  end
end

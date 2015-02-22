module Actioneer
  # An action class is the superclass of action type classes (called
  # action classes for short).  An example of a type would be "comment
  # approval", named CommentApprovalAction, and a ActionRequest would
  # specify the type "comment_approval" in the db, and
  # :comment_approval in Ruby.  Subclassing this class will create
  # such a new type, for which actions can be defined.  Actions are
  # triggered externally, but can be listed and interacted with.
  #
  # A good use of this would be in an admin interface to trigger the
  # creation of an Action Request of type :comment_approval, which
  # would show up in a list.  In that hypothetical example, the
  # available actions could be: 'approve', 'deny', where approve would
  # flag the record as approved, and deny would delete the record from
  # the DB.  Actions create ActionStatus objects which are used to
  # determine what is going on with the action.
  #
  # At some point, the action request is flagged as 'resolved' by some
  # external process, the action class, by whatever set of criteria
  # are required.  For example, new posts might require two moderators
  # to independently approve it before it goes live.  This would mean
  # that the action.  The action class gets access to the request
  # object and any status objects that are pertinent to that request
  # to evaluate state and/or do what needs to be done.  In the
  # two-moderators example, the action would get the "approve" method
  # called twice.  The first one would create a new status object, the
  # second would create the second status object, toggle the
  # "resolved" flag on the action request object, do the external
  # logic to approve the post, etc.
  #
  
  class Action
    # call for defining actions:
    def self.action(name,&block)
      @actions ||= {}
      @actions[name.to_sym] = { :block => block } if block
      @actions[name.to_sym]
    end

    def self.actions
      @actions.keys
    end

    def self.perform(name,request)
      the_action = self.action(name)
      throw "Invalid action: #{ name }" unless the_action
      the_action[:block].call(request)
    end
  end
end

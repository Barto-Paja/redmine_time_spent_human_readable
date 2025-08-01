module RedmineTimeSpentHumanReadable
  module Hooks
    class ViewHooks < Redmine::Hook::ViewListener
      render_on :view_my_account_preferences, partial: 'users/user_time_format'
    end
  end
end

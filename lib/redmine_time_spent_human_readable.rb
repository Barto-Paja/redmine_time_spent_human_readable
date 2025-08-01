module RedmineTimeSpentHumanReadable
end

require File.dirname(__FILE__) + '/redmine_time_spent_human_readable/hooks/view_hooks'
require File.dirname(__FILE__) + '/redmine_time_spent_human_readable/patches/user_preference_patch'
require File.dirname(__FILE__) + '/redmine_time_spent_human_readable/patches/time_helper_patch'

unless UserPreference.included_modules.include?(RedmineTimeSpentHumanReadable::Patches::UserPreferencePatch)
  UserPreference.send :prepend, RedmineTimeSpentHumanReadable::Patches::UserPreferencePatch
end
unless ApplicationHelper.included_modules.include?(RedmineTimeSpentHumanReadable::Patches::TimeHelperPatch)
  ApplicationHelper.send :include, RedmineTimeSpentHumanReadable::Patches::TimeHelperPatch
end
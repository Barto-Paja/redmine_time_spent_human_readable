require 'application_helper'
require 'redmine'

Redmine::Plugin.register :redmine_time_spent_human_readable do
    name 'Redmine Time Spent Human Readable Plugin'
    author 'Bartosz Pajewski'
    description 'Human-readable format for time tracking in Redmine.'
    version '1.0.0'
    url 'https://github.com/Barto-Paja/redmine_time_spent_human_readable'
    author_url 'https://github.com/Barto-Paja'
  end
  
require File.dirname(__FILE__) + '/lib/patches/time_helper_patch'
unless ApplicationHelper.included_modules.include?(Patches::TimeHelperPatch)
  ApplicationHelper.send :include, Patches::TimeHelperPatch
end
  
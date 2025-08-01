require_dependency 'user_preference'

module RedmineTimeSpentHumanReadable
  module Patches
    module UserPreferencePatch

      def self.prepended(base)
        base.class_eval do
          if defined? safe_attributes
            safe_attributes :time_display_format
          end
        end
      end

      def time_display_format
        self[:time_display_format] || 'h:m'
      end

      def time_display_format=(val)
        self[:time_display_format] = val
      end

      def time_display_format?
        !time_display_format.blank?
      end

    end
  end
end
UserPreference.prepend(RedmineTimeSpentHumanReadable::Patches::UserPreferencePatch)
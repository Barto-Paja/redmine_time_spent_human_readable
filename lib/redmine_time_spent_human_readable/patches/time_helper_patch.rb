require 'application_helper'

module RedmineTimeSpentHumanReadable
  module Patches
    module TimeHelperPatch
      def readable_time_label(label, minutes, hours, def_hours)
        if label.nil?
          "#{hours}:#{format('%02d', minutes)}"
        else
          case label
          when 'h.m'
            "#{def_hours.to_f}"
          when 'h:m'
            "#{hours}:#{format('%02d', minutes)}"
          when 'h_m'
            "#{hours}.#{format('%02d', minutes)}"
          end
        end
      end

      
      def format_hours(hours)
        v_hours = 0
        v_minutes = 0
        format = User.current&.pref&.time_display_format || 'h:m'
        if hours.nil?
          readable_time_label(format, v_minutes, v_hours, hours)
        else
          total_minutes = (hours * 60).round
          v_hours = total_minutes / 60
          v_minutes = total_minutes % 60
          readable_time_label(format, v_minutes, v_hours, hours)
        end
      end
    end
  end
end
ApplicationHelper.prepend(RedmineTimeSpentHumanReadable::Patches::TimeHelperPatch)


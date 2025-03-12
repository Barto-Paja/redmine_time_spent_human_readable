module Patches
    module TimeHelperPatch
      def format_hours(hours)
        total_minutes = (hours * 60).round
        hours = total_minutes / 60
        minutes = total_minutes % 60
        formatted_time = "#{hours}:#{format('%02d', minutes)}"
        formatted_time
      end
    end
end

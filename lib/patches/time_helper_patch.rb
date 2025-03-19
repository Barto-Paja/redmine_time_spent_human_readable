module Patches
  module TimeHelperPatch
    def format_hours(hours)
      if hours.nil?
        "0:00"
      else
        total_minutes = (hours * 60).round
        hours = total_minutes / 60
        minutes = total_minutes % 60
        "#{hours}:#{format('%02d', minutes)}"
      end
    end
  end
end

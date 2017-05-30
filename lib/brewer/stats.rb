require "brewer/stats/version"
require "brewer/stats/logger"
require "brewer/stats/formatter"
require "brewer"

module Brewer
  module Stats
    $stats_dir = Dir.home + "/.brewer/stats/"
    $log_file = $stats_dir + "log.yml"

    # This would be better with multiple threads, but this ain't C
    def self.json
      logger = Logger.new
      logger.capture_snapshot
      logger.store

      form = Formatter.new
      return form.get_log_contents.to_json
    end
  end
end

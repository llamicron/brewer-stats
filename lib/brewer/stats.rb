require "brewer/stats/version"
require "brewer/stats/logger"
require "brewer/stats/formatter"
require "brewer"

module Brewer
  module Stats
    $stats_dir = Dir.home + "/.brewer/stats/"
    $log_file = "log.yml"

    # This would be better with multiple threads, but this ain't C
    def self.json
      logger = Logger.new
      logger.capture_snapshot
      logger.store

      form = Formatter.new
      return form.get_log_contents.to_json
    end

    def self.log(log_file: $log_file, interval: 15)
      logger = Logger.new
      logger.interval = interval
      $log_file = log_file
      logger.log
    end
  end
end

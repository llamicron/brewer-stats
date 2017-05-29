require "brewer/stats/version"
require "brewer/stats/logger"
require "brewer/stats/formatter"
require "brewer"

module Brewer
  module Stats
    $stats_dir = Dir.home + "/.brewer/stats/"
    $log_file = $stats_dir + "log.yml"
  end
end

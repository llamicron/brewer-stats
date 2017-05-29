module Brewer
  module Stats
    class Formatter

      attr_accessor :log_contents

      def initialize
        @logger = Logger.new
        @log_contents = {}
      end

      def get_log_contents
        @log_contents = YAML.load(File.open(@logger.log_file))
      end

    end
  end
end

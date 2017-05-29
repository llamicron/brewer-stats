module Brewer
  module Stats
    class Formatter

      attr_accessor :log_contents

      def initialize
        @log_contents = {}
      end

      def get_log_contents
        @log_contents = YAML.load(File.open($log_file))
      end

      def self.json
        Formatter.new.get_log_contents.to_json
      end

    end
  end
end

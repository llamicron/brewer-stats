module Brewer
  module Stats
    class Logger

      attr_reader :controller, :stats_dir
      attr_accessor :state

      def initialize
        @controller = Brewer::Controller.new
        @state = {}

        create_stats_directory
        create_log_file
      end

      # :nocov:
      def log(interval: 15)
        while true do
          capture_snapshot
          store
          sleep(interval)
        end
      end
      # :nocov:

      def capture_snapshot
        @state['pv'] = @controller.pv
        @state
      end

      def store
        store = YAML::Store.new $log_file
        store.transaction {
          @state.each do |k, v|
            store[Time.now.to_i] = {k => v}
          end
        }
      end

      def create_stats_directory
        Dir.mkdir($stats_dir) unless File.exists?($stats_dir)
        true
      end

      def create_log_file
        File.open($log_file, 'w') unless File.exists?($log_file)
        true
      end

      def clear_log_file
        File.open($log_file, 'w') {|file| file.truncate(0) }
        true
      end

    end
  end
end

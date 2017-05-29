module Brewer
  module Stats
    class Logger

      attr_reader :controller, :log_file
      attr_accessor :state

      def initialize
        @controller = Brewer::Controller.new
        @stats_dir = Dir.home + "/.brewer/stats/"
        @log_file = @stats_dir + "log"
        @state = {}

        create_stats_directory
        create_log_file
      end

      def log(interval: 60)
        while true do
          capture_snapshot
          store
          sleep(interval)
        end
      end

      def capture_snapshot
        @state['pv'] = @controller.pv
        @state
      end

      def store
        store = YAML::Store.new @log_file
        store.transaction {
          @state.each do |k, v|
            store[Time.now] = {k => v}
          end
        }
      end

      def create_stats_directory
        Dir.mkdir(@stats_dir) unless File.exists?(@stats_dir)
        true
      end

      def create_log_file
        File.open(@log_file, 'w') unless File.exists?(@log_file)
        true
      end

    end
  end
end

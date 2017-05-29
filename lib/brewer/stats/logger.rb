module Brewer
  module Stats
    class Logger

      attr_reader :controller, :stats_dir
      attr_accessor :state

      def initialize
        @controller = Brewer::Controller.new
        @stats_dir = Dir.home + "/.brewer/stats/"
        @log_file = @stats_dir + "log.yml"
        @state = {}

        create_stats_directory
        create_log_file
      end

      # :nocov:
      def log(interval: 60)
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

      def log_file(new_file=false)
        @log_file = new_file if new_file
        create_log_file
        @log_file
      end

      def clear_log_file
        File.open(@log_file, 'w') {|file| file.truncate(0) }
        true
      end

    end
  end
end

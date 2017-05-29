require "spec_helper"

describe Brewer::Stats::Logger do

  before :each do
    @logger = Brewer::Stats::Logger.new
    $log_file = $stats_dir + "test_log.yml"
  end

  describe "#new" do
    it "returns a new logger object" do
      expect(Brewer::Stats::Logger.new).to be_an_instance_of Brewer::Stats::Logger
    end

    it "has a brewer controller" do
      expect(Brewer::Stats::Logger.new.controller).to be_an_instance_of Brewer::Controller
    end
  end

  describe ".capture_snapshot" do
    it "can capture a snapshot temperatures" do
      expect(@logger.state).to be_empty
      @logger.capture_snapshot
      expect(@logger.state).not_to be_empty
    end
  end

  describe ".store" do
    before { @logger.clear_log_file }
    specify { expect(File.zero?($log_file)).to be true }
    it "can store the current state in YAML" do
      @logger.capture_snapshot
      @logger.store
      expect(File.zero?($log_file)).to be false
    end
  end
end

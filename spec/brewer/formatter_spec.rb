require "spec_helper"

describe Brewer::Stats::Formatter do

  before :each do
    @form = Brewer::Stats::Formatter.new
    @logger = Brewer::Stats::Logger.new
    $log_file = $stats_dir + "test_log.yml"
  end

  describe "#new" do
    it "returns a formatter object" do
      expect(Brewer::Stats::Formatter.new).to be_an_instance_of Brewer::Stats::Formatter
    end

    it "has log contents" do
      expect(@form.log_contents).to be_empty
    end
  end

  describe ".get_log_contents" do
    before {
      @logger.capture_snapshot
      @logger.store
    }
    it "can get the log contents" do
      expect(@form.log_contents).to be_empty
      @form.get_log_contents
      expect(@form.log_contents).not_to be_empty
    end
  end

end

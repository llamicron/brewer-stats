require "spec_helper"

describe Brewer::Stats::Logger do
  describe "#new" do
    it "returns a new logger object" do
      expect(Brewer::Stats::Logger.new).to be_an_instance_of Brewer::Stats::Logger
    end
  end
end

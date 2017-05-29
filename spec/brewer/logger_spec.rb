require "spec_helper"

describe Brewer::Stats::Logger do
  describe "#new" do
    it "returns a new logger object" do
      expect(Brewer::Stats::Logger.new).to be_an_instance_of Brewer::Stats::Logger
    end

    it "has a brewer controller" do
      expect(Brewer::Stats::Logger.new.controller).to be_an_instance_of Brewer::Controller
    end
  end
end

require "spec_helper"

describe Brewer::Stats::Formatter do

  before :each do
    @form = Brewer::Stats::Formatter.new
  end

  describe "#new" do
    it "returns a formatter object" do
      expect(Brewer::Stats::Formatter.new).to be_an_instance_of Brewer::Stats::Formatter
    end

    it "has a logger and log contents" do
      expect(@form.logger).not_to be nil
      expect(@form.log_contents).to be_empty
    end
  end


end

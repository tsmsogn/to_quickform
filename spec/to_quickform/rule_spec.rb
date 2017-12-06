require "spec_helper"
require "to_quickform/rule"

RSpec.describe ToQuickform::Rule do
  subject(:rule) { described_class }

  describe "#new" do
    it "raises error without param" do
      expect { rule.new nil }.to raise_error
    end

    it "works with param" do
      expect(rule.new({ "type" => "required", "error_message" => "This field is required" })).to be_a ToQuickform::Rule
    end
  end
end

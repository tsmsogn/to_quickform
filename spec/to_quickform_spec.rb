require "spec_helper"

RSpec.describe ToQuickform do
  it "has a version number" do
    expect(ToQuickform::VERSION).not_to be nil
  end

  describe "::YAML" do
    it { expect(ToQuickform::YAML(path_to_file('sample.yaml'))).to be_a ToQuickform::Generator }
  end

  describe "::JSON" do
    it { expect(ToQuickform::JSON(File.open(path_to_file('sample.json')))).to be_a ToQuickform::Generator }
  end
end

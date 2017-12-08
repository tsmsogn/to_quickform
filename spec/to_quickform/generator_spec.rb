require "yaml"
require "spec_helper"
require "to_quickform/generator"

RSpec.describe ToQuickform::Generator do
  subject(:generator) { described_class } 
  let(:g1) { generator.new({ "data" => YAML.load_file(path_to_file("sample.yaml"))}) }
  let(:g2) { generator.new({ "data" => YAML.load_file(path_to_file("sample_php_variable.yaml"))}) }

  describe "#new" do
    describe "doesn't work without param" do
      it { expect { generator.new nil }.to raise_error }
    end

    describe "works with param" do
      it { expect(g1).to be_a ToQuickform::Generator }
    end
  end

  describe "#to_set_defaults" do
    it "works" do
      expect(g1.to_set_defaults).to eq File.read(path_to_file("set_defaults.txt"))
    end
  end

  describe "#to_create_element" do
    it "works" do
      expect(g1.to_create_element).to eq File.read(path_to_file("create_element.txt"))
    end

    it "works with quote_value" do
      expect(g2.to_create_element).to eq File.read(path_to_file("create_element_with_php_variable.txt"))
    end
  end

  describe "#to_add_rule" do
    it "works" do
      expect(g1.to_add_rule).to eq File.read(path_to_file("add_rule.txt"))
    end
  end
end

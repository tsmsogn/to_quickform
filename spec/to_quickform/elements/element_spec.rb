require "spec_helper"
require "to_quickform/elements/element"

RSpec.describe ToQuickform::Element::Element do
  subject(:element) { described_class }
  let(:text) { element.new({ "type" => "text" }) }

  it { expect(text).to respond_to("type") }
  it { expect(text).to respond_to("attribute") }
  it { expect(text).to respond_to("default") }
  it { expect(text).to respond_to("element") }
  it { expect(text).to respond_to("label") }
  it { expect(text).to respond_to("name") }
  it { expect(text).to respond_to("rule") }
  it { expect(text).to respond_to("separator") }
  it { expect(text).to respond_to("text") }
  it { expect(text).to respond_to("value") }

  describe "#new" do
    it "raises error without param" do
      expect { element.new nil }.to raise_error
    end

    it "works with type param" do
      expect(text).to be_a ToQuickform::Element::Element
    end
  end
end

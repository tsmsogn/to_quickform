require "spec_helper"
require "to_quickform/element_factory"

RSpec.describe ToQuickform::ElementFactory do
  subject(:factory) { described_class }

  describe ".new" do
    it "throws error if klass type is ommitted" do
      expect { factory.new nil }.to raise_error(ArgumentError)
    end
  end

  it "instantiates a checkbox object" do
    checkbox = factory.new({ "type" => "checkbox", "name" => "agree" })
    expect(checkbox).to be_a ToQuickform::Element::Checkbox
  end

  it "instantiates a group object" do
    group = factory.new({ "type" => "group", "name" => "postal_code", "element" => [{ "type" => "text" }, { "type" => "text" }] })
    expect(group).to be_a ToQuickform::Element::Group
  end

  it "instantiates a hidden object" do
    hidden = factory.new({ "type" => "hidden", "name" => "id", "value" => 1 })
    expect(hidden).to be_a ToQuickform::Element::Hidden
  end

  it "instantiates a password object" do
    password = factory.new({ "type" => "password", "name" => "id", "value" => 1 })
    expect(password).to be_a ToQuickform::Element::Password
  end

  it "instantiates a radio object" do
    radio = factory.new({ "type" => "radio", "name" => "subscribe" })
    expect(radio).to be_a ToQuickform::Element::Radio
  end

  it "instantiates a reset object" do
    reset = factory.new({ "type" => "reset", "name" => "reset_button" })
    expect(reset).to be_a ToQuickform::Element::Reset
  end

  it "instantiates a select object" do
    select = factory.new({ "type" => "select", "name" => "car", "value" => { "volvo" => "Volvo", "mercedes" => "Mercedes", "audi" => "Audi" } })
    expect(select).to be_a ToQuickform::Element::Select
  end

  it "instantiates a submit object" do
    submit = factory.new({ "type" => "submit", "name" => "submit" })
    expect(submit).to be_a ToQuickform::Element::Submit
  end

  it "instantiates a text object" do
    text = factory.new({ "type" => "text", "name" => "first_name" })
    expect(text).to be_a ToQuickform::Element::Text
  end

  it "instantiates a textarea object" do
    textarea = factory.new({ "type" => "textarea", "name" => "inquiry" })
    expect(textarea).to be_a ToQuickform::Element::Textarea
  end
end

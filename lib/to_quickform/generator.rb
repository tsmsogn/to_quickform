require "yaml"
require "to_quickform/base"
require "to_quickform/element_factory"
require "to_quickform/erb_factory"
require "to_quickform/erb_templates"

module ToQuickform
  # Generator
  class Generator < ToQuickform::Base
    include ToQuickform::ERBTemplates
    attr_required "data"
    attr_optional "form_default_template"

    def initialize(attributes = {})
      if attributes.is_a?(Hash)
        (required_attributes + optional_attributes).each do |key|
          value = attributes[key]
          self.send "#{key}=", value
        end
      end
      attr_missing!
    end

    def to_set_defaults
      erb = ToQuickform::ERBFactory.new(form_default_template).get_default_instance
      erb.result(binding)
    end

    def to_create_element
      elements.map do |element|
        # Read template to be used
        template = "form_#{element.type}_element_template"
        template = nil unless respond_to? template

        erb = ToQuickform::ERBFactory.new(template).get_element_instancue(element)
        erb.result(binding)
      end.join
    end

    def to_add_rule
      elements.map do |element|
        if element.rule

          name = element.name
          element.rule.map do |rule|
            # Read template to be used
            template = "form_#{rule.type}_rule_template"
            template = nil unless respond_to? template

            erb = ToQuickform::ERBFactory.new(template).get_rule_instance(rule)
            erb.result(binding)
          end.join
        end
      end.join
    end

    private

    def elements
      data["element"].map do |element|
        ToQuickform::ElementFactory.new(element)
      end
    end

    def defaults
      elements.select do |element|
        element.default
      end.inject({}) do |defaults, element|
        defaults.merge({ element.name => element.default })
      end
    end

    private

    def output(element, key)
      output = element.send(key).to_s
      output = "'#{output}'" if do_quote?(element, key)
      output
    end

    def do_quote?(element, key)
      method = "quote_" + key
      return true unless element.respond_to?(method)
      element.send(method)
    end
  end
end

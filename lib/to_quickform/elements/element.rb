require "to_quickform/base"
require "to_quickform/erb_factory"
require "to_quickform/erb_templates"
require "to_quickform/rule"

module ToQuickform
  module Element
    # Element
    class Element < ToQuickform::Base
      include ToQuickform::ERBTemplates
      attr_required "type"
      attr_optional "attribute", "default", "element", "label", "name", "rule", "separator", "text", "value"

      def initialize(attributes = {})
        if attributes.is_a?(Hash)
          (required_attributes + optional_attributes).each do |key|
            if key == "attribute"
              value = parse_attributes(attributes[key])
            elsif key == "rule"
              if attributes[key]
                value = attributes[key].map do |rule|
                  Rule.new(rule)
                end
              end
            else
              value = attributes[key]
            end
            self.send "#{key}=", value
          end
        end
        attr_missing!
      end

      private

      def parse_attributes(attributes)
        if attributes.is_a?(String)
          attributes
        elsif attributes.is_a?(Array)
          attributes.map do |attribute|
            attribute.to_a.map do |a|
              "#{a[0]}=\"#{a[1]}\""
            end
          end.join(" ")
        end
      end
    end
  end
end

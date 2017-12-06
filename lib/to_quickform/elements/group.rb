require "to_quickform/elements/element"

module ToQuickform
  module Element
    # GroupElement
    class Group < ToQuickform::Element::Element

      def initialize(attributes = {})
        if attributes.is_a?(Hash)
          (required_attributes + optional_attributes).each do |key|
            if key == "element"
              value = attributes[key].map do |element|
                ToQuickform::ElementFactory.new(element)
              end
            elsif key == "attribute"
              value = parse_attributes(attributes[key])
            elsif key == "rule"
              if attributes[key]
                value = attributes[key].map do |rule|
                  Rule.new(rule.merge({ "group" => true }))
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
    end
  end
end

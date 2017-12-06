require "to_quickform/base"

module ToQuickform
  # Rule
  class Rule < ToQuickform::Base
    attr_required "error_message", "type"
    attr_optional "compare_to", "format", "validation", "reset", "force", "group"

    def initialize(attributes = {})
      if attributes.is_a?(Hash)
        (required_attributes + optional_attributes).each do |key|
          value = attributes[key]
          self.send "#{key}=", value
        end
      end
      attr_missing!
    end

    def group?
      group
    end
  end
end

require "to_quickform/erb_templates"

module ToQuickform
  # ERBFactory
  class ERBFactory
    def initialize(custom_template)
      @custom_template = custom_template
    end

    def get_default_instance
      template = get_default_erb_template(@custom_template, "default")
      ERB.new(template, nil, '-', '_default')
    end

    def get_element_instancue(element)
      template = get_element_erb_template(@custom_template, element)
      ERB.new(template, nil, '-', '_element')
    end

    def get_rule_instance(rule)
      template = get_rule_erb_template(@custom_template, rule)
      ERB.new(template, nil, '-', '_rule')
    end

    private

    def get_default_erb_template(custom_template, template)
      if custom_template
        custom_template
      else
        case template
        when "default"
          ToQuickform::ERBTemplates::BASIC_DEFAULT
        end
      end
    end

    def get_element_erb_template(custom_template, element)
      if custom_template
        custom_template
      else
        case element.type
        when "checkbox"
          ToQuickform::ERBTemplates::BASIC_CHECKBOX_ELEMENT_TEMPLATE
        when "group"
          ToQuickform::ERBTemplates::BASIC_GROUP_ELEMENT_TEMPLATE
        when "radio"
          ToQuickform::ERBTemplates::BASIC_RADIO_ELEMENT_TEMPLATE
        when "select"
          ToQuickform::ERBTemplates::BASIC_SELECT_ELEMENT_TEMPLATE
        when "text"
          ToQuickform::ERBTemplates::BASIC_ELEMENT_TEMPLATE
        when "textarea"
          ToQuickform::ERBTemplates::BASIC_ELEMENT_TEMPLATE
        end
      end
    end

    def get_rule_erb_template(custom_template, rule)
      if custom_template
        custom_template
      elsif rule.group?
        ToQuickform::ERBTemplates::BASIC_GROUP_RULE_TEMPLATE
      else
        case rule.type
        when "compare"
          ToQuickform::ERBTemplates::BASIC_COMPARE_RULE_TEMPLATE
        when "numeric"
          ToQuickform::ERBTemplates::BASIC_RULE_TEMPLATE
        when "regex"
          ToQuickform::ERBTemplates::BASIC_RULE_TEMPLATE
        when "required"
          ToQuickform::ERBTemplates::BASIC_RULE_TEMPLATE
        end
      end
    end
  end
end

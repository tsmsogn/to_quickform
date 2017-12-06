require 'active_support'
require 'active_support/core_ext'
require "to_quickform/elements/checkbox"
require "to_quickform/elements/group"
require "to_quickform/elements/hidden"
require "to_quickform/elements/password"
require "to_quickform/elements/radio"
require "to_quickform/elements/reset"
require "to_quickform/elements/select"
require "to_quickform/elements/submit"
require "to_quickform/elements/text"
require "to_quickform/elements/textarea"

module ToQuickform
  # ElementFactory
  class ElementFactory
    def self.new(element)
      return create_instance(element["type"], element) if element
      raise ArgumentError, 'must provide element to be instantiated'
    end

    # Passes configuration options to instantiated class
    def self.create_instance(type, options)
      constant = ToQuickform::Element.const_get ActiveSupport::Inflector.camelize(type)
      constant.new options
    end
  end
end

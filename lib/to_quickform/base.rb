require "attr_required"
require "attr_optional"

module ToQuickform
  # Base
  class Base
    include AttrRequired, AttrOptional
  end
end

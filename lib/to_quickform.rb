require "to_quickform/generator"
require "to_quickform/version"

module ToQuickform
  def self.YAML(yaml)
    ToQuickform::Generator.new({ "data" => YAML.load(yaml) })
  end

  def self.JSON(json)
    ToQuickform::Generator.new({ "data" => JSON.load(json) })
  end
end

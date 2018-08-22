require "yaml"

module AnsiEscapes
  VERSION = (YAML.parse(File.read("./shard.yml")))["version"]
end

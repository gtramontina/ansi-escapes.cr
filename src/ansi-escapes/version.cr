require "yaml"

module AnsiEscapes
  VERSION = (YAML.load(File.read("./shard.yml")) as Hash)["version"]
end

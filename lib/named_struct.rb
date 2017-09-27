require "named_struct/version"

class NamedStruct < Struct
  VERSION = "0.1.0"

  # Allow initialization via positional arguments.
  def initialize(**kwargs)
    kwargs.each{ |k, v|
      if members.include?(k)
        self[k] = v
      else
        raise ArgumentError, "Unknown named struct member: #{k}"
      end
    }
  end
end

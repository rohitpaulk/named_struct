class NamedStruct < Struct
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

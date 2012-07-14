require "tryit/version"

class TryIt
  class << self
    attr_accessor :exceptions, :handler
  end

  @exceptions = [NoMethodError]
  @handler = lambda { |e| puts e.message }
end

class Object
  def tryit(*args, &block)
    if args.empty? && block_given?
      instance_eval &block
    else
      send(*args, &block)
    end
  rescue *TryIt.exceptions => e
    TryIt.handler.call(e)
  end
end

1.tryit(:dsdw)
TryIt.exceptions << ZeroDivisionError
tryit { 1/0 }

require "tryit/version"

module TryIt
  EXCEPTIONS = [NoMethodError]
  HANDLER = lambda { |e| puts e.message }
end

class Object
  def tryit(*args, &block)
    if args.empty? && block_given?
      instance_eval &block
    else
      send(*args, &block)
    end
  rescue *TryIt::EXCEPTIONS => e
    TryIt::HANDLER.call(e)
  end
end

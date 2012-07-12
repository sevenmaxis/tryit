require "tryit/version"

class Object
  def tryit(*args, &block)
    if args.empty? and block_given?
      begin
        instance_eval &block
      rescue NameError => e
        handler.handle
      end
    elsif respond_to?(args.first)
      send(*args, &block)
    end
  end
end

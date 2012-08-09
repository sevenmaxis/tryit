# Tryit

Another approach to Rail's `Object#try`. This is the result of a StackOverflow discussion between [Sergey Gopkalo](https://github.com/sevenmaxis/) and [Michael Kohl](https://github.com/citizen428).

Instead of

    obj1.try(:obj2).try(:obj3).try(:obj4).to_s

you can do this

    obj1.tryit { obj2.obj3.obj4.to_s }

You can customize which excpetions to catch:

    TryIt.exceptions << ZeroDivisionError
    obj.try { 1/0 }  # will not raise exceptions

There's also the possibility to define your own exception handlers:

    TryIt.handler = lambda { |_| puts "message from tryit" }
    obj.try { raise NoMethodError } # will print "message from tryit"

## Installation

Add this line to your application's Gemfile:

    gem 'tryit'

And then execute:

    $ bundle

Or install it yourself:

    $ gem install tryit

##

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

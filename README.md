# Tryit

another version of try

Instead of 

    obj1.try(:obj2).try(:obj3).try(:obj4).to_s

you can do this 

    obj1.tryit{ obj2.obj3.obj4.to_s }

Add exception to intercept this kind of exceptions

    TryIt.exceptions << ZeroDivisionError
    obj.try { 1/0 }  # will not raise exceptions

Change the handler 

    TryIt.handler = lambda { |_| puts "message from tryit" }
    obj.try { raise NoMethodError } # will print "message from tryit"

## Installation

Add this line to your application's Gemfile:

    gem 'tryit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tryit

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
# Tryit

another version of try

Instead of 

    obj1.try(:obj2).try(:obj3).try(:obj4).to_s

you can do this 

    obj1.tryit{ obj2.obj3.obj4.to_s }

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
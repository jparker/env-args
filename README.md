# EnvArgs

EnvArgs is a library for extracting environment variables. It was written
with an eye towards using variables for command line arguments in rake
tasks.

(Note that Rake already provides a command line argument facility, and it
should almost certainly be preferred.)

## Installation

Add this line to your application's Gemfile:

    gem 'env-args', github: 'jparker/env-args', require: 'env_args'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install env-args

## Usage

Once installed, you can call EnvArgs.variable, where "variable" can be
replaced with the variable name you want to retrieve. For example, to
retrieve a variable named FROM, call:

    EnvArgs.from

If you want to provide a default value to be returned in case the
environment variable is not set, you can pass in a block:

    EnvArgs.from { 'john@example.com' }

If the variable is required, i.e., you want to raise an exception
if the variable is not set, pass the required: keyword:

    EnvArgs.from required: true

You can use the required: keyword and a default value block together.
If the environment variable is not set and the block also returns nil
an exception will be raised:

    EnvArgs.from(required: true) { some_method_that_might_return_nil }

EnvArgs#method\_missing is used for most variables, so you can use just
about any variable name. A couple of special case variables are provided
with special handling:

1. EnvArgs.to is required by default. This may change in a future version,
but in the context for which this library was written, TO was always
required.

2. EnvArgs.date casts the return value to a Date object using
String#to\_date as implemented by ActiveSupport.


## Contributing

1. Fork it ( https://github.com/jparker/env-args/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

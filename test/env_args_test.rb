require File.expand_path('../lib/env_args', __dir__)
require 'minitest/autorun'

class EnvArgsTest < MiniTest::Test
  def test_variable
    ENV['FOO'] = 'Hello, nurse!'
    assert_equal 'Hello, nurse!', EnvArgs.foo
  end

  def test_variable_with_null_value
    ENV.delete('FOO')
    assert_nil EnvArgs.foo
  end

  def test_variable_with_default_value
    ENV.delete('FOO')
    assert_equal 'Hello, nurse!', EnvArgs.foo { 'Hello, nurse!' }
  end

  def test_required_variable_with_null_value
    ENV.delete('FOO')
    assert_raises(RuntimeError) { EnvArgs.foo(required: true) }
  end

  def test_required_variable_with_null_default
    ENV.delete('FOO')
    assert_raises(RuntimeError) { EnvArgs.foo(required: true) { nil } }
  end

  def test_to_variable_is_required
    ENV.delete('TO')
    assert_raises(RuntimeError) { EnvArgs.to }
  end

  def test_date_variable_is_cast_to_date
    ENV['DATE'] = '2014-06-04'
    assert_equal Date.new(2014, 6, 4), EnvArgs.date
  end
end

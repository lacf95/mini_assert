# frozen_string_literal: true

module MiniAssert
  class AssertionError < MiniAssert::Error; end

  # Assertion methods
  module Assertable
    def assert(expression, message = 'Expected a truthy value')
      raise AssertionError, message unless expression
    end

    def assert_equal(expected, value)
      assert(expected == value, "Expected #{expected.inspect} to equal #{value.inspect}")
    end

    def assert_exception(exception)
      yield
      assert(false, "Expected #{exception} but nothing was raised")
    rescue => e
      assert(e.class == exception, "Expected #{exception} got #{e.class}")
    end
  end
end

# frozen_string_literal: true

module MiniAssert
  class Error < StandardError; end
end

require 'mini_assert/version'
require 'mini_assert/assertable'
require 'mini_assert/test_case'
require 'mini_assert/crayon'
require 'mini_assert/test_suite'
require 'mini_assert/test_runnable'

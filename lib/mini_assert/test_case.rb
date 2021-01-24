# frozen_string_literal: true

module MiniAssert
  # Basic test case object
  class TestCase
    include Assertable

    attr_reader :total_tests, :passed_tests

    def initialize
      @total_tests = testable_methods.size
      @passed_tests = 0
    end

    def each_test!
      testable_methods.each do |testable_method|
        begin
          public_send testable_method
          @passed_tests += 1
        rescue MiniAssert::AssertionError => e
          file_name, method_line = method(testable_method).source_location
          yield("#{file_name}:#{method_line} #{e}") if block_given?
        end
      end
    end

    private

    def testable_methods
      @testable_methods ||= public_methods.select do |method_name|
        method_name.to_s =~ /test_.+/
      end.shuffle
    end
  end
end

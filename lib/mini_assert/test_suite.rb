# frozen_string_literal: true

module MiniAssert
  # Test executable object
  class TestSuite
    def initialize(test_classes)
      @test_classes = test_classes
      @results = { total_tests: 0, passed_tests: 0 }
    end

    def run!
      @test_classes.each do |test_class|
        test_obj = test_class.new
        test_obj.each_test! { |message| show_failure message }
        @results[:total_tests] += test_obj.total_tests
        @results[:passed_tests] += test_obj.passed_tests
      end
      show_results
    end

    private

    def show_results
      ratio_string = "#{@results[:passed_tests]}/#{@results[:total_tests]}"
      status = if @results[:passed_tests] == @results[:total_tests]
                 MiniAssert::Crayon.green(ratio_string)
               else
                 MiniAssert::Crayon.red(ratio_string)
               end
      puts "[#{status}] tests succeded"
    end

    def show_failure(message)
      status = MiniAssert::Crayon.red('fail')
      puts "[#{status}] #{message}"
    end
  end
end

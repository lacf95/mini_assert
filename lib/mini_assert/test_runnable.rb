# frozen_string_literal: true

require 'find'

module MiniAssert
  # Finds, load and run test in given directory
  class TestRunnable
    def initialize(path = '.', file_matcher = /.+_test\.rb$/)
      @path = path
      @file_matcher = file_matcher
      require_test
    end

    def run!
      MiniAssert::TestSuite.new(testable_classes).run!
    end

    private

    def testable_classes
      @testable_classes ||= begin
                              classes = []
                              ObjectSpace.each_object(Class) do |class_const|
                                next unless class_const < MiniAssert::TestCase

                                classes << class_const
                              end
                              classes
                            end
    end

    def require_test
      test_files.each do |file|
        require file
      end
    end

    def test_files
      @test_files ||= begin
                        found_files = []
                        Find.find(@path) do |file|
                          found_files << file if file =~ @file_matcher
                        end
                        found_files
                      end
    end
  end
end

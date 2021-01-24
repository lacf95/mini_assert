# frozen_string_literal: true

module MiniAssert
  # STD_OUT printing colors
  class Crayon
    class << self
      def colorize(color_code, string)
        "\e[#{color_code}m#{string}\e[0m"
      end

      def green(string)
        colorize(32, string)
      end

      def red(string)
        colorize(31, string)
      end
    end
  end
end

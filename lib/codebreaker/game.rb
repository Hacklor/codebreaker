module Codebreaker

  class Game

    attr_reader :output

    def initialize(output)
      @output = output
    end

    def start
      output.puts 'Welcome to Codebreaker!'
      output.puts 'Enter guess:'
    end
  end

end

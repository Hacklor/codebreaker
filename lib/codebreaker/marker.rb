module Codebreaker

  class Marker

    attr_reader :secret, :guess

    def initialize(secret, guess)
      @secret = secret
      @guess = guess
    end

    def exact_match_count
      (0..3).inject(0) do |count, index|
        count + (exact_match?(index) ? 1 : 0)
      end
    end

    def number_match_count
      total_match_count - exact_match_count
    end

    def total_match_count
      count = 0
      secret_code = secret.split('')
      guess.split('').map do |n|
        if secret_code.include?(n)
          secret_code.delete_at(secret_code.index(n))
          count += 1
        end
      end
      count
    end

    private
    def exact_match?(index)
      guess[index] == secret[index]
    end

    def number_match?(index)
      secret.include?(guess[index]) && !exact_match?(index)
    end

  end

end

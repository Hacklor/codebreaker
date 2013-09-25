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

    private

    def total_match_count
      secret_code = secret.split('')
      guess.split('').inject(0) do |count, number|
        count + (delete_first(secret_code, number) ? 1 : 0)
      end
    end

    def delete_first(code, number)
      code.delete_at(code.index(number)) if code.index(number)
    end

    def exact_match?(index)
      guess[index] == secret[index]
    end

    def number_match?(index)
      secret.include?(guess[index]) && !exact_match?(index)
    end

  end

end

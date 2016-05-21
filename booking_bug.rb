module BookingBug
  def delete_array(array, exclude_array = Array(6..9))
    array.delete_if { |x| exclude_array.include? x }
  end

  def print_permutations(array)
    array.permutation.each do |element|
      puts element.inspect
    end
  end

  def random_array(x = 5, y = 5, option_array = %w(Yes No Maybe))
    Array.new(x) do
      Array.new(y) do
        option_array.sample
      end
    end
  end

end

class BankLee
  extend BookingBug

  class << self
    def print_q1
      puts 'Answer 1'
      puts delete_array([4, 7, 8, 'x']).inspect
      puts
    end

    def print_q2
      puts 'Answer 2'
      print_permutations([4 ,7 ,8, 'x'])
      puts
    end

    def print_q3
      puts 'Answer 3'
      random_array.each do |element|
        puts element.inspect
      end
      puts
    end
    
  end
end

BankLee.print_q1
BankLee.print_q2
BankLee.print_q3
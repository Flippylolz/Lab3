a = Array.new(3){ Array.new(3){ rand(-10..10) }}
p a.flatten.select { |a| a > 0 }.inject(:+)

h = {'yes' => 23, 'b' => 'travel', 'yesterday' => 34,
     5 => '234', :yesss => :fg, try: 30, key: 'some value',
     'yesterday1' => 34, 'yesteryear' => 2014}
p h.select {|k| k =~ /\byes\w*/ }.size
# p h.flatten.select {|k| k=~/yes*/}#.count
# regexp
# Array methods ruby
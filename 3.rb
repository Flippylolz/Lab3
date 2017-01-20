class Vibor
  def sel
    h={'yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234' , :yesss => :fg, try: 30, key: 'some value', 'yesterday1' => 34, 'yesteryear' => 2014}
    h.select {|k| k =~ /\byes\w*/}.size
  end
end

yes=Vibor.new
p yes.sel

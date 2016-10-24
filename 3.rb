class Vibor
  #attr_accessor :some1
  def initialize (some)
    @some = some#  встоений метод которий принимает параметри для класса
  end
  def sel
    @some.select {|k| k =~ /\byes\w*/}.size
  end
end

yes=Vibor.new({'yes' => 23, 'b' => 'travel', 'yesterday' => 34, 5 => '234' , :yesss => :fg, try: 30, key: 'some value', 'yesterday1' => 34, 'yesteryear' => 2014})
p yes.sel
#yes.some1 = "Hey" #setter
#p yes.some1 #getter
#yes1=Vibor.new({'yes' => 1,'yas' => 2,'kek' =>'???'})
#p yes1.sel

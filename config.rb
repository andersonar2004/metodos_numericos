# Defini��o de constantes
IMAX = 200
EA = 0.0001

# intervalo para funcao 1
PI = Math::PI
def intervalo(n)
  [[0,0.5], [4, 4.5], [7.5, 8], [10.5, 11], [14, 14.5], [17, 17.5]][n]
  a = (n+1)*PI + (2*(PI)/5)
  b = a+PI/10
  
  s = 0
  s = n*PI+(26+n.to_f)/20 if (n>0)
  #puts "=> #{s-0.1} - #{s+0.1} "
  [s-0.1, s+0.1 ]
end

# intervalo para funcao 2
def intervalo2(n)
  [[0,0.5], [1.5, 2], [3.5, 4], [5, 5.5], [6.5, 7], [8.5, 9]][n]
  # 0.0 1.96, 1.72, 1.64 , 1.61
  # 1.96, 0.38, 0.24, 0.08, 0.04 
  # 1+(24/25) 1+(18/25) 1(16/25) 1/(15/25)
  # 24  18  16  15
  # 10   4   2   1
  #  1   2   3   4
  s = 0.0
  (n).times do |x|
    x = x+1
    aux = -(2*(x-6))/x
    s = s + 1 + ((aux.to_f+14)/25)
  end if n > 0
  # puts "=> #{s-0.1} - #{s+0.1} "
  [s-0.1, s+0.1 ]
end

# cuncao de calculo 1
$funcao = Proc.new do |x|
  x.to_f - Math.tan(x)
end

# cuncao de calculo 2
$funcao2 = Proc.new do |x|
  x.to_f/2 - Math.tan(2*x)
end

load 'config.rb'

funcao = Proc.new do |x|
  fx = x.to_f - Math.tan(x)
  flx = 1 - (1 / Math.cos(x.to_f)) ** 2 # derivada da funcao
  {fx: fx, flx:  flx}
end

funcao2 = Proc.new do |x|
  fx = x.to_f/2 - Math.tan(2*x)
  flx = (1.to_f / 2).to_f - (2 * (1/Math.cos(2*x.to_f)) ** 2 ) # derivada da funcao
  {fx: fx, flx:  flx}
end

# METODO DO NEWTON RAPHSON
# Tipo: Escalar
# x0 - aproximação inicial (chute incial)
# erro - erro aceitavel
# imax = numero maximo de iteracoes
# funcao = funcao reescrita do que se quer calcular
def newton_raphson(x0, erro, imax, funcaog = funcao)
  i = 0
  ea = 100
  x = x0
  while( ea > erro && i<imax ) 
    xtemp = x
    result = funcaog.call(xtemp)
    fx = result[:fx]
    flx = result[:flx]
    x = xtemp - (fx / flx)
    i = i + 1
    if (x!=0)
      ea = ((x.to_f - xtemp.to_f)/ x.to_f ).abs  * 100
    end
    puts "#{i}\t#{x}\t#{fx}\t#{flx}\t#{ea}"
  end
  return {raiz: x, iteracoes: i}
end


f = File.new('newton_raphson.out', 'w')
# Calcula as 5 primeiras raizes
# Bissecao a = 2
f.puts "Newton Raphson a = 2 e = #{EA}, imax #{IMAX}"
5.times do |i|
  intervar = intervalo2(i)[0]
  result = newton_raphson((intervar), EA, IMAX, funcaof = funcao2)
  f.puts "(#{intervar}) #{result[:raiz]} iteracoes #{result[:iteracoes]}"
end
f.puts ""
# Bissecao a = 1
f.puts "Newton Raphson a = 1 e = #{EA}, imax #{IMAX}"
5.times do |i|
  intervar = intervalo(i)[1]
  result = newton_raphson((intervar), EA, IMAX, funcaof = funcao)
  f.puts "(#{intervar}) #{result[:raiz]} iteracoes #{result[:iteracoes]}"
end
f.close








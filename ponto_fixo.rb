load 'config.rb'

funcao = Proc.new do |x|
  fx = x.to_f - Math.tan(x)
  gx = 1 - (1.to_f/Math.cos(x.to_f)) ** 2 # derivada da funcao
  x.to_f - (fx/gx)
end

funcao2 = Proc.new do |x|
  fx = x.to_f/2 - Math.tan(2*x)
  gx = (1.to_f / 2).to_f - (2 * ((1.to_f/Math.cos(2*x.to_f)) ** 2) ) # derivada da funcao
  x.to_f - (fx/gx)
end


# METODO DO PONTO FIXO
# Tipo: Escalar
# x0 - aproximação inicial (chute incial)
# erro - erro aceitavel
# imax = numero maximo de iteracoes
# funcaog reescrita do que se quer calcular
def ponto_fixo(x0, erro, imax, funcaog)
  i = 0
  ea = 100
  x = x0

  while( ea > erro && i<imax ) 
    xtemp = x
    x = funcaog.call(xtemp)
    i = i + 1
    if (x!=0)
      ea = ((x.to_f - xtemp.to_f)/ x.to_f ).abs  * 100
    end
    puts "#{i}\t#{x}\t#{ea}"
  end

  return {raiz: x, iteracoes: i}
end


f = File.new('ponto_fixo.out', 'w')
# Calcula as 5 primeiras raizes
# Bissecao a = 2
f.puts "Ponto fixo a = 2 e = #{EA}, imax #{IMAX}"
5.times do |i|
  intervar = intervalo2(i)
  result = ponto_fixo(intervar[0], EA, IMAX, funcao2)
  f.puts "(#{intervar[0]}) #{result[:raiz]} iteracoes #{result[:iteracoes]}"
end
f.puts ""
# Bissecao a = 1
f.puts "Ponto fixo a = 1 e = #{EA}, imax #{IMAX}"
5.times do |i|
  intervar = intervalo(i)[1]
  result = ponto_fixo(intervar, EA, IMAX, funcao)
  f.puts "(#{intervar}) #{result[:raiz]} iteracoes #{result[:iteracoes]}"
end
f.close







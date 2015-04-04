load 'config.rb'


# METODO DA SECANTE
# Tipo: Escalar
# x0 - aproximação inicial (chute incial)
# erro - erro aceitavel
# imax = numero maximo de iteracoes
# funcao = funcao reescrita do que se quer calcular
def secante(x0, x1, erro, imax, funcaog = funcao)
  i = 0
  ea = 100
  # valor referencia para a funcao
  xr = 0.5671432
  x = i
  while( ea > erro && i<imax ) 
    xtemp = x
    f0 = funcaog.call(x0)
    f1 = funcaog.call(x1)
    x = x1 - (f1 * ((x0-x1) / (f0-f1)))
	#puts "x1 - (f1 * ((x0-x1) / (f0-f1)))"
	#puts "#{x1} - ( #{f1} * ( #{x0} - #{x1} ) / ( #{f0} - #{f1})) "
    i = i + 1
    if (x!=0)
      ea = ((x.to_f - xtemp.to_f)/ x.to_f ).abs  * 100
    end

    x0 = x1
    x1 = x
    
  # puts "#{i}\t#{x}\t#{f1}\t#{ea}"
  $out.puts "#{i}\t#{x0}\t#{x1}\t#{ea}" if $out!=nil
  end
  $out.puts "" if $out!=nil
  return {raiz: x, iteracoes: i}
end

f = File.new('secante.out', 'w')
# Calcula as 5 primeiras raizes
# Bissecao a = 2
f.puts "Secante a = 2 e = #{EA}, imax #{IMAX}"
5.times do |i|
  intervar = intervalo2(i)
  result = secante(intervar[0], (intervar[1]), EA, IMAX, $funcao2)
  f.puts "(#{intervar[0]}, #{intervar[1]} ) #{result[:raiz]} iteracoes #{result[:iteracoes]}"
end
f.puts ""
# Bissecao a = 1
f.puts "Secante a = 1 e = #{EA}, imax #{IMAX}"
5.times do |i|
  intervar = intervalo(i)
  result = secante(intervar[0], (intervar[1]), EA, IMAX, $funcao)
  f.puts "(#{intervar[0]}, #{intervar[1]} ) #{result[:raiz]} iteracoes #{result[:iteracoes]}"
end
f.close







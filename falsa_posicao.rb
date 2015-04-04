load 'config.rb'

# METODO DA FALSA POSICAO
# Tipo: Escalar
# xl - intervalo inferior
# xu - intervalo superior
# erro - erro aceitavel
# imax = numero maximo de iteracoes
# funcao = funcao que se quer calcular a raiz
def falsa_posicao(xl, xu, erro, imax, funcaof = funcao)
  x = xl.to_f
  i = 0
  ea = 100
  fl = funcaof.call(xl)
  fu = funcaof.call(xu)
  if fl.abs < fu.abs 
    x = xl
  else
    x = xu
  end
  
  while( ea > erro && i<imax ) 
    xtemp = x
    x = xu + (fu * (xl - xu)) / (fu - fl)
	#puts "#{x} = #{xu} + (#{fu} * (#{xl}-#{xu}) / (#{fu} - #{fl})"
    fx = funcaof.call(x)
    i = i + 1
    if (x!=0)
      ea = ((x.to_f - xtemp.to_f).abs/ x.to_f ).abs  * 100
    end

    if ( fl.abs < fu.abs )
      xl = x
      fl = fx
    else
      xu = x
      fu = fx
    end
    #puts "#{i}\t#{xl}\t#{xu}\t#{fl}\t#{fu}\t#{ea}"
    $out.puts  "#{i}\t#{xl}\t#{xu}\t#{x}\t#{ea}" if $out!=nil
  end
  return {raiz: x, iteracoes: i}
end



f = File.new('falsa_posicao.out', 'w')
# Calcula as 5 primeiras raizes
# Bissecao a = 2
f.puts "Falsa Posicao a = 2 e = #{EA}, imax #{IMAX}"
5.times do |i|
  intervar = intervalo2(i)
  result = falsa_posicao(intervar[0], intervar[1], EA, IMAX, $funcao2)
  f.puts "(#{intervar[0]}, #{intervar[1]}) #{result[:raiz]} iteracoes #{result[:iteracoes]}"
end
f.puts ""
# Bissecao a = 1
f.puts "Falsa Posicao a = 1 e = #{EA}, imax #{IMAX}"
5.times do |i|
  intervar = intervalo(i)
  result = falsa_posicao(intervar[0], intervar[1], EA, IMAX, $funcao)
  f.puts "(#{intervar[0]}, #{intervar[1]}) #{result[:raiz]} iteracoes #{result[:iteracoes]}"
end
f.close



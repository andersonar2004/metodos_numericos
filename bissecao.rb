load 'config.rb'

# METODO DA BISSEÇÃO
# Tipo: Escalar
# xl - intervalo inferior
# xu - intervalo superior
# erro - erro aceitavel
# imax = numero maximo de iteracoes
# funcao = funcao que se quer calcular a raiz
def bissecao(xl, xu, erro, imax, funcaof = funcao)
  x = xl.to_f
  i = 0
  ea = 100
  fl = funcaof.call(xl) 
  while( ea > erro && i<imax ) 
    xtemp = x
    x = (xl.to_f + xu.to_f) / 2
    fx = funcaof.call(x)
    i = i + 1
    if (x!=0)
      ea = ((x.to_f - xtemp.to_f).abs / x.to_f ).abs * 100
    end

    if ( fl * fx <= 0 )
      xu = x
    else
      xl = x
      fl = fx
    end
    $out.puts  "#{i}\t#{xl}\t#{xu}\t#{x}\t#{ea}" if $out!=nil
  end
  return {raiz: x, iteracoes: i}
end


f = File.new('bissecao.out', 'w')
# Calcula as 5 primeiras raizes
# Bissecao a = 2
f.puts "Bissecao a = 2 e = #{EA}, imax #{IMAX}"
5.times do |i|
  intervar = intervalo2(i)
  result = bissecao(intervar[0], intervar[1],EA, IMAX, $funcao2)
  f.puts "(#{intervar[0]}, #{intervar[1]}) \t #{result[:raiz]} iteracoes #{result[:iteracoes]}"
end
f.puts ""
# Bissecao a = 1
f.puts "Bissecao a = 1 e = #{EA}, imax #{IMAX}"
5.times do |i|
  intervar = intervalo(i)
  result = bissecao(intervar[0], intervar[1], EA, IMAX, $funcao)
  f.puts "(#{intervar[0]}, #{intervar[1]}) \t #{result[:raiz]} iteracoes #{result[:iteracoes]}"
end
f.close






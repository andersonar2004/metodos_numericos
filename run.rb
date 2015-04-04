# enconding: utf-8
$out = File.new('saida.out', 'w')
load 'bissecao.rb'
load 'falsa_posicao.rb'
load 'ponto_fixo.rb'
load 'newton_raphson.rb'
load 'secante.rb'


g = File.new('run.out', 'w')
g.puts "f(x) e = #{EA}, imax #{IMAX}"
$out.puts "f(x) e = #{EA}, imax #{IMAX}" if $out!=nil

5.times do |i|
  intervar = intervalo(i)
  g.puts "\n[#{intervar[0]}, #{intervar[1]}]"

  $out.puts "\nBiseeção [#{intervar[0]}, #{intervar[1]}]" if $out!=nil
  result = bissecao(intervar[0], intervar[1], EA, IMAX, $funcao)
  g.puts "Bisseção\t#{result[:raiz]}\t#{result[:iteracoes]}"
  
  $out.puts "\nFalsa Posição [#{intervar[0]}, #{intervar[1]}]" if $out!=nil
  result = falsa_posicao(intervar[0], intervar[1], EA, IMAX, $funcao)
  g.puts "Falsa Posição\t#{result[:raiz]}\t#{result[:iteracoes]}"
  
  $out.puts "\nPonto Fixo [#{intervar[1]}]" if $out!=nil
  result = ponto_fixo(intervar[1], EA, IMAX, $funcaopf)
  g.puts "Ponto Fixo\t#{result[:raiz]}\t#{result[:iteracoes]}"
  
  $out.puts "\nNewton Raphson [#{intervar[1]}]" if $out!=nil
  result = newton_raphson((intervar[1]), EA, IMAX, $funcaon)
  g.puts "Newton Raphson\t#{result[:raiz]}\t#{result[:iteracoes]}"
  
  $out.puts "\nSecante [#{intervar[0]}, #{intervar[1]}]" if $out!=nil
  result = secante(intervar[0], (intervar[1]), EA, IMAX, $funcao)  
  g.puts "Secante\t#{result[:raiz]}\t#{result[:iteracoes]}"

end

# Calcula as 5 primeiras raizes
# Bissecao a = 2
g.puts "g(x) e = #{EA}, imax #{IMAX}"
$out.puts "g(x) e = #{EA}, imax #{IMAX}" if $out!=nil
5.times do |i|
  intervar = intervalo2(i)
  g.puts "\n[#{intervar[0]}, #{intervar[1]}]"
  
  $out.puts "\nBiseeção [#{intervar[0]}, #{intervar[1]}]" if $out!=nil
  result = bissecao(intervar[0], intervar[1], EA, IMAX, $funcao2)
  g.puts "Bisseção\t#{result[:raiz]}\t#{result[:iteracoes]}"
  
  $out.puts "\nFalsa Posição [#{intervar[0]}, #{intervar[1]}]" if $out!=nil
  result = falsa_posicao(intervar[0], intervar[1], EA, IMAX, $funcao2)
  g.puts "Falsa Posição\t#{result[:raiz]}\t#{result[:iteracoes]}"
  
  $out.puts "\nPonto Fixo [#{intervar[1]}]" if $out!=nil
  result = ponto_fixo(intervar[1], EA, IMAX, $funcaopf2) 
  g.puts "Ponto Fixo\t#{result[:raiz]}\t#{result[:iteracoes]}"
  
  $out.puts "\nNewton Raphson [#{intervar[1]}]" if $out!=nil
  result = newton_raphson((intervar[1]), EA, IMAX, $funcaon2)
  g.puts "Newton Raphson\t#{result[:raiz]}\t#{result[:iteracoes]}"
  
  $out.puts "\nSecante [#{intervar[0]}, #{intervar[1]}]" if $out!=nil
  result = secante(intervar[0], (intervar[1]), EA, IMAX, $funcao2)  
  g.puts "Secante\t#{result[:raiz]}\t#{result[:iteracoes]}"
end

g.puts ""

g.close

$out.close if $out!=nil
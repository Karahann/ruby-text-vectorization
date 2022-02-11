metin = (File.read"cevaplar.txt")

kelimeler = metin.downcase.split.uniq
sozluk ={}

kelimeler.each.with_index do |kelime, i|
    sozluk.merge!({ "#{kelime}" => i+1})
end

sozluk.merge!("OOV" => 48)
satirlar = metin.split("\n")

satirlar.each do |satır|
  puts "---------------------------------------------------------------------------"
  print "#{satır} -> "
  e = []

  satır.downcase.split.each do |kelime1|
    e<<sozluk[kelime1]
  end

  print e
  puts ""
end

puts "---------------------------------------------------------------------------"
print "Vektorlestirmek istediginiz cümleyi giriniz(Tukce karakter kullanmayınız): "
begin
  girdi = gets.chomp.split
puts "==========================================================================="

dizi = []

girdi.each do |kelime2|

  if sozluk.include?(kelime2.downcase)
    dizi<<sozluk[kelime2.downcase]
  else
    dizi<<sozluk["OOV"]
  end

end

puts "Cumleniz ve vektor degeri: '#{girdi.join(" ")}' -> #{dizi}"
puts "---------------------------------------------------------------------------"

rescue ArgumentError
  puts "*********************************************"
  puts "Turkce karakter girdiniz."
  puts "*********************************************"
end
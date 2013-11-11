#!/usr/bin/env ruby

brands = [];
counter = {};
print "["
Dir.foreach('.') do |brand| 
  next if brand == '.' or brand == '..' or not Dir.exists?(brand) #it is a file
  brands += [brand]; 
  print "["
  for type in ["twowire", "fivewire", "fivewiredigit","twowiredigit"]
    countermodel = 0
    if Dir.exist?(brand+"/"+type)
      Dir.foreach(brand+"/"+type) do |model|
        next if model == '.' or model == '..'
        file = brand+"/"+type+"/"+model+"/"+brand+"_"+type+"_"+model+".jpg"
        puts file if not File.exists? ( file)
        countermodel+=1 
      end
    else
      
    end
    print "[",countermodel,"],"
  end
  print "],"
end
print "]"
puts 
puts brands.join('","')

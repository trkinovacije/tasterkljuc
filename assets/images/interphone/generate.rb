#!/usr/bin/env ruby

brands = ["farfisa","tehtel","urmet","videx","bitron","elvox"]
types = ["twowire", "fivewire", "fivewiredigit","unsupported"]
print "["
for brand in brands 
  next if brand == '.' or brand == '..' or not Dir.exists?(brand) #it is a file
  print "["
  for type in types 
    if Dir.exist?(brand+"/"+type)
      checkModelCounter = "0"
      folders = Dir.entries(brand+"/"+type).sort
      print "["
      for model in folders
        next if model == '.' or model == '..'
        if model == checkModelCounter
          checkModelCounter.succ!
        else
          print "check model counter "+brand+"/"+type+"/"+model
        end
        mainImage = brand+"_"+type+"_"+model+".jpg"
        mainImagePath = brand+"/"+type+"/"+model+"/"+mainImage
        puts mainImagePath if not File.exists? ( mainImagePath)
        puts mainImagePath+".wires" if not File.exists? ( mainImagePath+".wires")
        puts mainImagePath+".connections" if not File.exists? ( mainImagePath+".connections")
        files = Dir.entries(brand+"/"+type+"/"+model).sort
        checkImageCounter = "0"
        counterImage = 1
        for image in files
          next if image == '.' or image == '..'
          next if [mainImage, mainImage+".wires",mainImage+".connections"].include? image
          if image == [brand,type,model,checkImageCounter].join("_")+".jpg"
            checkImageCounter.succ!
          else
           puts "check image counter "+brand+"/"+type+"/"+model+"/"+image
          end
          counterImage += 1
        end
        print "[",counterImage,"],"
      end
      print "],"
    else
     print "[],"
    end
  end
  print "],"
end
print "];"
puts 
puts brands.join('","')
puts types.join('","')

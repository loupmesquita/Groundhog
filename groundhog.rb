#!/usr/bin/env ruby
# coding: utf-8
##
## EPITECH PROJECT, 2021
## ground
## File description:
## ground
##

def is_number? string
    true if Float(string) rescue false
end

def aberrations(standev, moy, one, tab_ab, tab_abinc)

#  bplus, bminus = 0.0
  bplus = (moy + (standev * 2))
  bminus = (moy - (standev * 2))
 # puts "b+ : #{bplus} | b- :#{bminus} | moy: #{moy}"
  if (bplus - one.to_f) < (one.to_f - bminus)
    ##puts "#{bplus} - #{one} / #{bplus} - #{bminus} "
    res = (bplus - one.to_f)/(bplus - bminus)
  else res = (one.to_f - bminus)/(bplus - bminus)
  end 
#  tab_ab[tab_abinc][0] = one.to_f
 # tab_ab[tab_abinc][1] = res
 tab_ab[[tab_abinc,0]]= one.to_f
 tab_ab[[tab_abinc,1]]= res
 # tab_ab["#{one}"] = res   # fonctionne mais ne peut avoir plusieurs même valeur pour one 
 #tab_ab = { 
#  "#{one}" => res
#  }
#  puts "abber: #{res}"
end

def tri(tab)
 # tab.each { |clé, valeur| puts "La valeur #{valeur} est associée à la clé #{clé}." }
 # tab.each_with_index { |v, i| puts "La valeur #{v} est associée à l’indice #{i}." }
 #tab.each_value { |valeur| puts "La valeur #{valeur} est dans le hachage." }
  #tab.each_key { |clé| puts "La clé #{clé} est une des clés du hachage." }
  #for i in 0..tab.length
 
  i = ((tab.length)/2) - 1
  j = 0
  while i!=0
    table = true
    for j in 0..(i-1)
     # puts "je rentre dans le while"
      if ((tab[[j+1, 1]].to_f) < (tab[[j, 1]].to_f))
        tab[[(j+1), 1]], tab[[j, 1]] = tab[[j, 1]], tab[[(j+1), 1]]
        tab[[(j+1), 0]], tab[[j, 0]] = tab[[j, 0]], tab[[(j+1), 0]]
        table = false
     # else j -= -1
      end
    end
    break if table
    i -= 1
  end
end 


if ARGV[0] == "-h"
  puts "SYNOPSIS"
  puts "\t./groundhog period"
  puts "DESCRIPTION"
  puts "\tperiod\tthe number of days defining a period"
  exit()
end

arg = ARGV[0]
if (ARGV.length > 1 || ARGV.length < 1)
  exit(84)
end

if !is_number?(arg)
  puts "Error synthax"
  exit(84)
end
arg = arg.to_f
switch = 0
#weird = nil
#weird = "26.7, 24.0, 21.6, 36.5, 42.1"
incerr = 0;
i= 0
x= 0
y = 0
z = 0
h = 0
j = 0
tempinav = 0
retempev = 0
standev = 0.0
#swi = nil
tab = Array.new
#tab_ab = Array.new
#tab_ab = Array.new { Array.new(2) { 0 } }
#tab_ab = Hash.new   #Array.new
tab_ab= Hash.new

o = 0
moyinav = 0.0
moy = 0.0
var = 0
neg = 0.2
switchocc = 0
tab_abinc = 0

while (1)
  one_f = STDIN.gets
  one_f ||= ''
  one_f.chomp!
  if (one_f == "STOP" && incerr < arg)
    exit(84)
  end
  if (one_f == "STOP")
    tri(tab_ab)
    if ((tab_ab.length)/2) < 5
      nbw = (tab_ab.length)/2
    else nbw = 5
    end

    puts "Global tendency switched #{switch} times"
    #puts "5 weirdest values are [#{tab_ab[[0,0]]}, #{tab_ab[[1,0]]}, #{tab_ab[[2,0]]}, #{tab_ab[[3,0]]}, #{tab_ab[[4,0]]}]"
    print "#{nbw} weirdest values are ["
  #  puts (tab_ab.length)
    if ((tab_ab.length)/2) == 1
      print tab_ab[[0,0]]
    end
    if ((tab_ab.length)/2) < 5
  #    puts "r"
      m = 0
      for i in 0..((tab_ab.length)/2) - 2
        print (tab_ab[[i, 0]])
        print ", "
        m = i
      end 
      print tab_ab[[m+1,0]]
    else 
      for k in 0..3
        print (tab_ab[[k, 0]])
        print ", "
      end
      print tab_ab[[4,0]]
    end 
    
    puts "]"

    #  puts "36.5 = #{tab_ab["36.5"]}"
    #  puts "36.5 = #{tab_ab[0]}"
  #  puts "36.5 = #{tab_ab}"
  #  puts "inc : #{tab_abinc}"
  #  puts ('\n')
  #  puts bubbletree(tab_ab)
    exit(0)
  end
  if !is_number?(one_f)
    puts "Error synthax"
    exit(84)
  end
  
  #while i < arg
  if i < arg - 1 
    puts "g=nan\tr=nan%\ts=nan"
##add
moye = one_f.to_f
while h > 0
  moye = moye + (tab[o-h].to_f) 
  h = h - 1
end
moye = moye / (o + 1)
vare = (one_f.to_f - moye)*(one_f.to_f - moye)
while j > 0
  vare = vare + ((tab[o-j].to_f - moye)*(tab[o-j].to_f - moye))
  j = j - 1
end
    vare = vare / (o + 1)
    stan = (Math.sqrt(vare))

    if o>0
    aberrations(stan, moye, one_f, tab_ab, tab_abinc)
    tab_abinc -= -1
    end
    ##add
    #while i == arg
  elsif i == (arg - 1)
    #    puts x
    moy = one_f.to_f
    while x > 0
      moy = moy + (tab[o-x].to_f) 
      x = x - 1
    end
    #    puts moy
    #  puts o 
    moy = moy / (o + 1)
    #   puts moy
    var = (one_f.to_f - moy)*(one_f.to_f - moy)
    while y > 0
      var = var + ((tab[o-y].to_f - moy)*(tab[o-y].to_f - moy))
      y = y - 1
    end
    var = var / (o + 1)
    #    puts var
    standev = (Math.sqrt(var))
    aberrations(standev, moy, one_f, tab_ab, tab_abinc) 
    tab_abinc -= -1
    puts ("g=nan\tr=nan"+ "%" + "\ts=%.2f" %standev) 
    # print ("s=%0.2f\t" % dev)
  else
    x = arg -1
    y = arg -1
    if (one_f.to_f - (tab[o-1].to_f)) >= 0
      moyinav = (one_f.to_f - (tab[o-1].to_f))
    else
      moyinav = 0
    end
    n = o - (arg)
    z = o
    while z > (o - (arg-1))
      #  puts moyinav
      #  if !((tab[z].to_f - tab[z-2].to_f).negative?())
      if (tab[z-1].to_f - tab[z-2].to_f) >= 0
        moyinav = moyinav + (tab[z-1].to_f - tab[z-2].to_f)
      else moyinav = moyinav
      end
      z = z - 1
    end
    #  puts "tempinave:#{moyinav}"
  #  puts arg
    tempinav = (moyinav / arg)
    # calc of r

    retempev = ((((((one_f.to_f) - (tab[o-(arg)].to_f)) / tab[o-(arg)].to_f))) * 100)
    if (tab[o-(arg)].to_f).negative?
      retempev = ((((((one_f.to_f) - (tab[o-(arg)].to_f)) / (-tab[o-(arg)].to_f)))) * 100)
    end
    if (tab[o-(arg)].to_f) == 0
      retempev = ((((((one_f.to_f) - (tab[o-(arg)].to_f)) / (1)))) * 100)
    end
    if ((switchocc < 0 && retempev >=0)||(switchocc >= 0 && retempev <0))
#      if ((switchocc < 0 && (retempev >=0 && retempev != Inf))||((switchocc >= 0 && switchocc != Inf )&& retempev <0))

      swi = "\ta switch occurs"
      switch = switch + 1
    else
      swi = ""
    end 
    #calc of ecart type
    moy = one_f.to_f
    while x > 0
 #     puts moy
 #     puts "x = #{x}"
      moy = moy + (tab[o-x].to_f) 
      x = x - 1
    end
  #      puts moy
  #  puts o 
    moy = moy / (arg)
  #  puts moy
    var = (one_f.to_f - moy)*(one_f.to_f - moy)
    while y > 0
      var = var + ((tab[o-y].to_f - moy)*(tab[o-y].to_f - moy))
      y = y - 1
    end
    var = var / (arg)
  #  puts var
    standev = (Math.sqrt(var))
    aberrations(standev, moy, one_f, tab_ab, tab_abinc)  
    tab_abinc -= -1   
    puts ("g=%.2f" %tempinav + "\tr=%.0f" %retempev + "%\t"+ "s=%.2f#{swi}" %standev)

  end
  tab[o] = one_f
  o -= -1
  x -= -1
  y -= -1
  z = arg
  i -= -1
  h -= -1
  j -= -1
  switchocc = retempev
  incerr -= -1
end

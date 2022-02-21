#!/usr/bin/env ruby
# coding: utf-8
##
## EPITECH PROJECT, 2021
## ground
## File description:
## ground
##

require "./Utils.rb"
require "./Algorythm.rb"


arg = ARGV[0]
if (ARGV.length > 1 || ARGV.length < 1)
  exit(84)
end

if !Utils.is_number?(arg)
  puts "Error synthax"
  exit(84)
end
arg = arg.to_f
switch = 0
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
tab = Array.new
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
    Utils.printWeirdValues(tab_ab, switch)
    exit(0)
  end
  if !Utils.is_number?(one_f)
    puts "Error synthax"
    exit(84)
  end
  
  if i < arg - 1 
    puts "g=nan\tr=nan%\ts=nan"
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
      Algorythm.aberrations(stan, moye, one_f, tab_ab, tab_abinc)
      tab_abinc -= -1
    end
  elsif i == (arg - 1)
    moy = one_f.to_f
    while x > 0
      moy = moy + (tab[o-x].to_f) 
      x = x - 1
    end
    moy = moy / (o + 1)
    var = (one_f.to_f - moy)*(one_f.to_f - moy)
    while y > 0
      var = var + ((tab[o-y].to_f - moy)*(tab[o-y].to_f - moy))
      y = y - 1
    end
    var = var / (o + 1)
    standev = (Math.sqrt(var))
    Algorythm.aberrations(standev, moy, one_f, tab_ab, tab_abinc) 
    tab_abinc -= -1
    puts ("g=nan\tr=nan"+ "%" + "\ts=%.2f" %standev) 
  else

    #calc of Temperature increase average
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
      if (tab[z-1].to_f - tab[z-2].to_f) >= 0
        moyinav = moyinav + (tab[z-1].to_f - tab[z-2].to_f)
      else moyinav = moyinav
      end
      z = z - 1
    end
    
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
      
      swi = "\ta switch occurs"
      switch = switch + 1
    else
      swi = ""
    end 
    #calc of ecart type
    moy = one_f.to_f
    while x > 0
      moy = moy + (tab[o-x].to_f) 
      x = x - 1
    end
    moy = moy / (arg)
    var = (one_f.to_f - moy)*(one_f.to_f - moy)
    while y > 0
      var = var + ((tab[o-y].to_f - moy)*(tab[o-y].to_f - moy))
      y = y - 1
    end
    var = var / (arg)
    standev = (Math.sqrt(var))
    Algorythm.aberrations(standev, moy, one_f, tab_ab, tab_abinc)  
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

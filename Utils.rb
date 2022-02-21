module Utils
    def Utils.help()
      #test
      if ARGV[0] == "-h"
        puts "SYNOPSIS"
        puts "\t./groundhog period"
        puts "DESCRIPTION"
        puts "\tperiod\tthe number of days defining a period"
        exit()
      end
      a = 0
    end
    
    def Utils.is_number? string
      true if Float(string) rescue false
    end
  
    def Utils.printWeirdValues(tab_ab, switch)
      Algorythm.bubbleSort(tab_ab)
      if ((tab_ab.length)/2) < 5
        nbw = (tab_ab.length)/2
      else nbw = 5
      end
      
      puts "Global tendency switched #{switch} times"
      print "#{nbw} weirdest values are ["
      if ((tab_ab.length)/2) == 1
        print tab_ab[[0,0]]
      end
      if ((tab_ab.length)/2) < 5
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
    end
    
  end
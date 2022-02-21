module Algorythm
    def Algorythm.aberrations(standev, moy, one, tab_ab, tab_abinc)
      
      bplus = (moy + (standev * 2))
      bminus = (moy - (standev * 2))
      if (bplus - one.to_f) < (one.to_f - bminus)
        res = (bplus - one.to_f)/(bplus - bminus)
      else res = (one.to_f - bminus)/(bplus - bminus)
      end 
      tab_ab[[tab_abinc,0]]= one.to_f
      tab_ab[[tab_abinc,1]]= res
    end
    
    def Algorythm.bubbleSort(tab)
      i = ((tab.length)/2) - 1
      j = 0
      while i!=0
        table = true
        for j in 0..(i-1)
          if ((tab[[j+1, 1]].to_f) < (tab[[j, 1]].to_f))
            tab[[(j+1), 1]], tab[[j, 1]] = tab[[j, 1]], tab[[(j+1), 1]]
            tab[[(j+1), 0]], tab[[j, 0]] = tab[[j, 0]], tab[[(j+1), 0]]
            table = false
          end
        end
        break if table
        i -= 1
      end
    end 
  
  end
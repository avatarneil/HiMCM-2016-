import numpy as np
import csv

#import all data as arrays & set initial values.
americaData = list(csv.reader(open("america.csv")))
positionData = list(csv.reader(open("positions.csv")))
positionData = np.array(positionData)
americaData = np.array(americaData)
warehouselist=[]
#guess=[3,86,123,175,153,195,260,179,308,334,563,490,504,522,545,437,484,510,508,496,387,254,286,332,378,398]
#guessinit =[3,86,123,175,153,195,260,179,308,334,563,490,504,522,545,437,484,510,508,496,387,254,286,332,378,398]
guess=[3,0,123,0,153,195,260,179,308,334,563,0,504,522,545,437,484,510,508,496,387,254,286,332,378,398]
guessinit=[3,0,123,0,153,195,260,179,308,334,563,0,504,522,545,437,484,510,508,496,387,254,286,332,378,398]
#uess=np.array(guess)
manualguess5=[423,392,358,549,165,45,90,471,301,361,362,15,46,268,338,452,269,246,340,238]

whichpixel=[0 for x in range(192738)]
zerotest=0
def sumfunc(listentry):
    global zerotest
    guesssum=[0 for x in range(192738)]
    for i in range(0,192737):
        for k in range(0,len(listentry)):
          if (listentry[k] == 0):
              zerotest=1
              print('sumfunczerotest')
              print(listentry[k])
          elif ((positionData[(listentry[k]-1)][i] == "1") and zerotest==0):
              guesssum[i] = 1
              print('notzero')
    guesssum = np.array(guesssum)
    return guesssum

def pixelcost(listentry):
    global zerotest
    pixcost = 0
    if (zerotest==1):
        pixcost = 100000000000000000000000000
        zerotest=0
        print('pixelcostzerotest')
    for i in range(0,192511):
        if ((americaData[0][i]=='1') and (listentry[i]==0)):
            pixcost+=1
    return pixcost    
    
bestguess=[3, 66, 73, 175, 173, 425, 320, 21, 298, 334, 563, 500, 504, 522, 545, 437, 314, 510, 468, 536, 367, 554, 266, 342, 478, 398]
bestguess2=[3, 66, 73, 173, 425, 320, 21, 298, 334, 563, 500, 504, 522, 545, 437, 314, 510, 468, 536, 367, 554, 266, 342, 478, 398,493,479]
    
def minimize() :    
  #  guess2=[3,86,123,175,153,195,260,179,308,334,563,490,504,522,545,437,484,510,508,496,387,254,286,332,378,398]
   # guess2=[3,86,123,175,153,195,260,179,308,334,563,490,504,522,545,437,484,510,508,496,387,254,286,332,378,398]
    guess2=[3,0,123,0,153,195,260,179,308,334,563,0,504,522,545,437,484,510,508,496,387,254,286,332,378,398]

    incfact=1
   
    for k in range(1):
        a=0
        inc=10*incfact
        i=0
        print(k)
        print('Current improvement: ' + str(pixelcost(sumfunc(guessinit)) - pixelcost(sumfunc(guess))))
        while (i<25):
            print('i =' + str(i))
            randfact = np.random.randint(681)
            if (((guess2[i]+inc)<691) and ((guess2[i] + inc) > 0)):
                guess2[i] += inc
            elif (((guess2[i]+inc)<691) and ((guess2[i] + inc) < 0)):
                guess2[i]=abs(guess2[i]+inc)
                print('negativeflip')
            elif (((guess2[i]+inc)<691) and ((guess2[i] + inc) == 0)):
                guess2[i]
            print('guess i is ' + str(guess[i]))
            print('guess2 i is ' + str(guess2[i]))
        
            cost2 = pixelcost(sumfunc(guess2))
            cost = pixelcost(sumfunc(guess))
        
            if (cost2 < cost):
                print('better')
                guess[i] = guess2[i]
                inc=10*incfact
                i+=1
                a=0
            elif ((cost2 >= cost) and (a==0)):
                print('worse first time')
                inc=-2*inc
                a=1
            elif ((cost2 >= cost) and (a==1)):
                print('worse not first time')
                inc=10*incfact
                guess2[i]=guess[i]
                i+=1
                a=0
                
             
            print('moving on')
            
        incfact+=1
        
        print(guess)
        print(guess2)
    
    

for i in range(692):
    if (i<10):
        u="000"+str(i)
        warehouselist.append(u)
    elif (i<100):
        u="00"+str(i)
        warehouselist.append(u)
    elif (i<1000):
        u="0"+str(i)
        warehouselist.append(u)
whichpixel = sumfunc(bestguess2)

whichpixel = np.array(whichpixel)
warehouselist=np.array(warehouselist)
whichpixel.tofile('bestguess3.csv',sep=',',format='%10.5f')
#guesssum.tofile('guesssum.csv',sep=',',format='%10.5f')

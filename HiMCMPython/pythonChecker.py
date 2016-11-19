import numpy as np
import csv

#import all data as arrays & set initial values.
americaData = list(csv.reader(open("america.csv")))
positionData = list(csv.reader(open("positions.csv")))
positionData = np.array(positionData)
americaData = np.array(americaData)
warehouselist=[]
guess=[3,86,123,175,153,195,260,179,308,334,563,490,504,522,545,437,484,510,508,496,387,254,286,332,378,398]
#uess=np.array(guess)

whichpixel=[0 for x in range(192738)]

def sumfunc(listentry):
    guesssum=[0 for x in range(192738)]
    for i in range(0,192737):
        for k in range(0,len(listentry)):
          if (positionData[(listentry[k]-1)][i] == "1"):
              guesssum[i] = 1
    guesssum = np.array(guesssum)
    return guesssum

def pixelcost(listentry):
    pixcost = 0
    for i in range(0,192511):
        if ((americaData[0][i]=='1') and (listentry[i]==0)):
            pixcost+=1
    return pixcost     
def minimize() :    
    guess2=[3,86,123,175,153,195,260,179,308,334,563,490,504,522,545,437,484,510,508,496,387,254,286,332,378,398]
    

    incfact=1
   
    for k in range(1,10):
        a=0
        inc=100*incfact
        i=0
        while (i<25):
            print('i =' + str(i))
        
            guess2[i] += inc
        
        
            cost2 = pixelcost(sumfunc(guess2))
            cost = pixelcost(sumfunc(guess))
        
            if (cost2 < cost):
                print('better')
                guess[i] = guess2[i]
                inc=100*incfact
                i+=1
                a=0
            elif ((cost2 >= cost) and (a==0)):
                print('worse first time')
                inc=-inc
                a=1
            elif ((cost2 >= cost) and (a==1)):
                print('worse not first time')
                inc=100*incfact
                i+=1
                a=0
             
            print('moving on, guess i is ' + str(guess[i]))
            print('guess2 i is ' + str(guess2[i]))
             
        incfact+=1   
            
    
    
    
    
    
    
    
    
    
    
minimize()
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

whichpixel = np.array(whichpixel)
warehouselist=np.array(warehouselist)
whichpixel.tofile('whichpixel.csv',sep=',',format='%10.5f')
#guesssum.tofile('guesssum.csv',sep=',',format='%10.5f')
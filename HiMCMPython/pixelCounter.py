import numpy as np
import csv

popamerica = list(csv.reader(open("popamerica2.csv")))

popamerica = np.array(popamerica)
pixcount=0
for i in range(249857):
    if (popamerica[0][i] == '1'):
        pixcount+=1
        
        
print(pixcount)
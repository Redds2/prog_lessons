#f = open('find_error.pas','w')

#for i in range(1,101):
#    f.write('a[%d]:=%d;\n'%(i,i**3))
    
#f.close()
import random
f = open('calc_average.pas','w')


for i in range(1,29):
    f.write('a[%d]:=%d;\n'%(i,random.randint(-2,2) + i//7*3 ))
    
f.close()
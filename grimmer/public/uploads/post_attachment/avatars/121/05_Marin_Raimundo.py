from sys import stdin
import math

def ang(a,b,c):
    return math.acos((a**2 + b**2 - c**2)/(2.0 * a * b))

cases = stdin.readline().strip()


for c in range(int(cases)):
	radios = stdin.readline().strip().split()
	
	b = float(radios[1]) + float(radios[2])
	li = float(radios[1]) + float(radios[0])
	ld = float(radios[0]) + float(radios[2])
	s = (li+b+ld)/2
	area= (s*(s-li)*(s-b)*(s-ld))**(1/2) 
	bli= math.degrees(ang(li,b,ld))
	bld = math.degrees(ang(b,ld,li))
	lild= 180-bld - bli
	print(lild,bli,bld)
	ab = (float(radios[0])**2)*math.pi*lild/360
	ali = (float(radios[1])**2)*math.pi*bli/360
	ald = (float(radios[2])**2)*math.pi*bld/360
	result = area-ald-ab-ali
	print('%.6f'%result)


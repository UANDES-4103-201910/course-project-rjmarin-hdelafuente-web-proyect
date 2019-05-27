from sys import stdin
import math

stdin = open("out.txt")

def line_intersect(m1, b1, m2, b2):
    x = (b2 - b1) / (m1 - m2)
    y = m1 * x + b1
    return x,y
print("INTERSECTING LINES OUTPUT")
cases = stdin.readline().strip()
for i in range(int(cases)):
	points = stdin.readline().strip().split()
	x1=float(points[0])
	y1=float(points[1])
	x2=float(points[2])
	y2=float(points[3])
	x3=float(points[4])
	y3=float(points[5])
	x4=float(points[6])
	y4=float(points[7])
	if x2 ==x1:
		if x3==x4:
			if x3==x1:
				print("LINE")
				continue
			else:
				print("NONE")
				continue
		else:
			pr2=(y4-y3)/(x4-x3)
			n2 = y3 -pr2*x3
			y = pr2*x1 +n2
			print("POINT "+ str('%.2f'%x1) +" " + str('%.2f'%y))
			continue
	if x3==x4:
		if x1==x2:
			if x3==x1:
				print("LINE")
				continue
			else:
				print("NONE")
				continue
		else:
			pr1=(y2-y1)/(x2-x1)
			n1 = y1 -pr1*x1
			y = pr1*x3 +n1
			print("POINT "+ str('%.2f'%x3) +" " + str('%.2f'%y))
			continue
	pr1=(y2-y1)/(x2-x1)
	pr2=(y4-y3)/(x4-x3)
	n2 = y3 -pr2*x3
	n1 = y1 -pr1*x1
	if pr1 ==pr2:
		Y= pr2*x1 +n2
		if y1==Y:
			print("LINE")
		else:
			print("NONE")
	else:
		x,y = line_intersect(pr1,n1,pr2,n2)
		print("POINT "+ str('%.2f'%x) +" " + str('%.2f'%y))
print("END OF OUTPUT")




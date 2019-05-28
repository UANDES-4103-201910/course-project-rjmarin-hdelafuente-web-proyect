from sys import stdin

stdin = open("input.txt")
cases = int(stdin.readline())

def factorial(n):
	if n == 0:
		return 1
	return n*factorial(n-1)
	

for c in range(cases):
    number_matrix = int(stdin.readline())
    ways = factorial(number_matrix*2)/(factorial(number_matrix)*factorial(number_matrix))
    print(int(ways))


    
        
    
    






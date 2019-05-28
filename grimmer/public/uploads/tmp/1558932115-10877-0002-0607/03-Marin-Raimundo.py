from sys import stdin

stdin = open("input.txt")


def points(card1):
	sum = 0
	if card1 == "A":
		sum = 11
	elif card1 == "2":
		sum = 2
	elif card1 == "3":
		sum = 3
	elif card1 == "4":
		sum = 4
	elif card1 == "5":
		sum = 5
	elif card1 == "6":
		sum = 6
	elif card1 == "7":
		sum = 7
	elif card1 == "8":
		sum = 8
	elif card1 == "9":
		sum = 9
	elif card1 in [ "T", "K", "J", "Q"]:
		sum = 10

	return sum


	
def rest(cards, decks):
	suit = ["A", "2","3","4","5","6","7","8","9","T","J", "Q", "K"]
	deck = suit * 4
	total = deck*int(decks)
	for c in cards:
		total.remove(c)
	return total

r = stdin.readline()
while r != "0":
	decks = int(r)
	cards = stdin.readline()
	cards = cards.split()
	player_points = points(cards[1]) + points(cards[2])
	if player_points == 22:
		player_points = 12
	deckss = rest(cards,r)
	count = 0
	for card in deckss:
		dealer_points = points(cards[0]) + points(card)
		if dealer_points == 22:
			dealer_points = 12
		if player_points > dealer_points:
			count +=1

	print(round(count*100/len(deckss),3),"%")	
	r = stdin.readline()


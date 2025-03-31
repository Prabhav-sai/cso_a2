all: q1 q2 q3

q1:
	gcc q1/q1.c q1/q1.s -o q1ans

q2:
	gcc q2/q2.c q2/q2.s -o q2ans

q3:
	gcc q3/q3.c q3/q3.s -o q3ans

clean:
	rm -f q1 q2 q3

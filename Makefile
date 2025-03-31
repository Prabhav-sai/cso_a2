all: q1 q2 q3 q4 q5

q1:
	gcc src/q1/q1.c src/q1/q1.s -o q1

q2:
	gcc src/q2/q2.c src/q2/q2.s -o q2

q3:
	gcc src/q3/q3.c src/q3/q3.s -o q3

clean:
	rm -f q1 q2 q3

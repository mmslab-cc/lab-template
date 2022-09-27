a.out:
	gcc source/* include/*

test: a.out
	bash test.sh

f = open("train_qrels_2011_2012_2013_all.txt")
f2 = open("train_qrels_2011_2012_2013.txt", "w")
f3 = open("dev_qrels_2011_2012_2013.txt", "w")

n = 0
for l in f:
    n += 1
    if n % 10 == 0:
        f3.write(l)
    else:
        f2.write(l)


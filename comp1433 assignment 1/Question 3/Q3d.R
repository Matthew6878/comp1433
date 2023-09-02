#case1:

r = 1
p = 0.05
n = 104 - r

# the theoretical results of case 1
print(dnbinom(x = n, size = r, prob = p))

r = 9
p = 0.05
n = 104 - r

# the theoretical results of case 2
print(dnbinom(x = n, size = r, prob = p))

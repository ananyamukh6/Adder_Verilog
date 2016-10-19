#golden output

testFreq = 150
lines = open('out1.txt').readlines()
f = open('out.txt', 'w')
s = 0; c = 0.
for lineNum in range(1,len(lines)):
	line = lines[lineNum]
	timeStamp = int(line.split('-')[0])
	if timeStamp%testFreq == 0 and timeStamp > 0:
		prevLine = lines[lineNum-1]
		t = prevLine.split('sum:')[1].split('carry_out:')
		#print t
		u = prevLine.split('-')
		#print u
		sum = int(t[0].strip().strip(','))
		carry = int(t[1])
		delay = int(u[0].strip(',')) - (timeStamp-testFreq)
		f.write(str(sum) + ' ' + str(carry) + '\n')
		print sum,carry
		#print delay; s += delay; c += 1
lastline = lines[-1]
v = lastline.split('sum:')[1].split('carry_out:')
#sum1 = int(v[0].strip().strip(','))
sum1 = int((lastline.split('sum:')[1].split('carry_out:'))[0].strip().strip(','))
#print sum1
carry1 = int(v[1])
print sum1,carry1
f.write(str(sum1) + ' ' + str(carry1))
f.close()
#print s/c

#count nors
print 'nor', sum([1 for i in open('transcript').readlines() if 'hello nor' in i])
#print 'cla_adder', sum([1 for i in open('transcript').readlines() if 'hello cla_adder' in i])
#print 'cla_generator4', sum([1 for i in open('transcript').readlines() if 'hello cla_generator4' in i])
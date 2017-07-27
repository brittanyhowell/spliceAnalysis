#!/bin/python

import itertools

original = 'AGCT'


# count = 1

f = open("SJMap.txt","w") 

for n in itertools.product(original, repeat=4):
   perm = ''.join(n)

   # For copy - pasting
   # f.write( '\"%s\": %d,\n' % (perm, count))
   # print '\"%s\": %d,' % (perm, count)

	# For file writing
   f.write( '%s\n' % perm)
   print '%s' % perm
   # count = count +1


f.close() 

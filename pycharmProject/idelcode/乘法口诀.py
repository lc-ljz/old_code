for i in range(1,10):
    for j in range(1,10):
        if(i>=j):
            result = i * j
            print ('%d * %d = % -3d' % (i,j,result))
        print ('')
input()

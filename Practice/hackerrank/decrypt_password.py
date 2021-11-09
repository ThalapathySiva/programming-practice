#!/bin/python3

import math
import os
import random
import re
import sys


#
# Complete the 'decryptPassword' function below.
#
# The function is expected to return a STRING.
# The function accepts STRING s as parameter.
#

def decryptPassword(s):
    # Write your code here
    finalString=[]
    number_list=[]
    for i,x in enumerate(s):
        if x == '0':
            finalString.append(number_list.pop())
        elif x.isnumeric():
            number_list.append(x)
        elif x == '*':
            finalString [-1] , finalString[-2] = finalString[-2] ,finalString[-1]
        else:
            finalString.append(x)
    return ''.join([str(elem) for elem in finalString])
if __name__ == '__main__':
    fptr = open(os.environ['OUTPUT_PATH'], 'w')

    s = input()

    result = decryptPassword(s)

    fptr.write(result + '\n')

    fptr.close()
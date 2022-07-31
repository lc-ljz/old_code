# -*- coding: utf-8 -*-
"""
Created on Wed Mar 10 14:22:03 2021

@author: LJZ
"""

# 命令提示符环境中
# python F:\anaconda程序\python学习\CodeFramework.py F:\anaconda程序\python学习\CodeFramework2.py
import sys
import os
import datetime

head = '#' + '-' * 20 + '\n' + \
    '#Function description: \n' + \
    '#' + '-' * 20 + '\n' + \
    '#Author:Liu Jiuzhou\n' + \
    '#QQ:1234567890\n' + \
    '#Email:123@163.com\n' +\
    '#' + '-' * 20 + '\n'

desFile = sys.argv[1]
print(desFile)
if os.path.exists(desFile) or not desFile.endswith('.py'):
    print('%s already exit or is not a python file!'%desFile)
    sys.exit()
fp = open(desFile,'w')
today = str(datetime.date.today())
fp.write('# -*- coding: utf-8 -*-\n')
fp.write('#Filename' + desFile + '\n')
fp.write(head)
fp.write('#Date:' + today + '\n')
fp.write('#' + '-'*20 + '\n')
fp.close()
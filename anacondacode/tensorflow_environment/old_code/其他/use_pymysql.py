# -*- coding: utf-8 -*-
"""
Created on Fri Sep 13 16:34:48 2019

@author: LJZ
"""
#x=[2,2,2]
#from numpy.matlib import repmat
#A=repmat(x,3,1)
#p=range(3)
#A=A**p
#print(A)

#from numpy import pi
#import numpy as np
#x=[-pi/2,pi,5*pi/2]
#print(x[-1])
#a=np.random.randn(20)

####################################
#无数据库，错误

import pymysql
import re
  
def idinput(string):
 ID = input(string)
 pattern = re.compile("^\d{1,3}$")
 while not re.match(pattern, ID):
  ID = input("请输入1-3位整数:")
 return ID
  
def appendStudentInfo():
 ID =idinput("请输入学生学号：")
 db=pymysql.connect(host="127.0.0.1",user="root",passwd="hisense",db="test",port=3306,charset="utf8")
 cursor=db.cursor()
 sql = "select * from StuSys where ID = '%s'" % ID
 cursor.execute(sql)
 while cursor.rowcount > 0 :
  ID = idinput("该学号已存在，请重新输入:")
  sql = "select * from StuSys where ID = '%d'" % int(ID)
  cursor.execute(sql)
  
 name=input("请输入学生姓名：")
  
 chinese=input("请输入语文成绩：")
 while not chinese.isdigit() or int(chinese)>100 or int(chinese)<0:
  chinese = input("输入错误，请重新输入：")
  
 math =input("请输入数学成绩：")
 while not math.isdigit() or int(math) > 100 or int(math) < 0:
  math = input("输入错误，请重新输入：")
  
 english=input("请输入英语成绩：")
 while not english.isdigit() or int(english) > 100 or int(english) < 0:
  english = input("输入错误，请重新输入：")
  
 total=int(chinese)+int(math)+int(english)
  
 sql="""INSERT INTO StuSys(ID,
   NAME,CHINESE,ENGLISH,MATH,TOTAL)
   VALUES (%s,%s,%s,%s,%s,%s)"""
 cursor.execute(sql,(ID,name,chinese,english,math,total))
 db.commit()
 db.close()
  
def delstudent():
 delstudentid = idinput("请输入要删除的学生学号：")
 if querystudent(delstudentid):
  select = input("是否删除：是(Y)/否（N）")
  if select == "Y" or select == "y":
   db = pymysql.connect(host="127.0.0.1", user="root", passwd="hisense", db="test", port=3306, charset="utf8")
   cursor = db.cursor()
   sql = "delete from stusys where ID =%s" %delstudentid
   cursor.execute(sql)
   db.commit()
   db.close()
   print("删除成功")
  elif select == "N" or select == "n":
   print("取消删除")
  else:
   print("输入错误")
  
  
def querystudent(querystudentid):
 db=pymysql.connect(host="127.0.0.1",user="root",passwd="hisense",db="test",port=3306,charset="utf8")
 cursor=db.cursor()
 sql="select * from stusys where ID=%s"%querystudentid
 cursor.execute(sql)
 if cursor.rowcount ==0 :
  print("不存在该学生信息")
  return False
 else:
  print("该学生信息如下：")
  results =cursor.fetchall()
  print("ID=%d,NAME=%s,CHINESE=%d,ENGLISH=%d,MATH=%d,TOTAL=%d" % \
   (results[0][0], results[0][1], results[0][2], results[0][3], results[0][4],results[0][5]))
  return True
  
def modifystudentifo():
 modifyid = idinput("请输入要的学生学号：")
 if querystudent(modifyid):
  name = input("请重新输入学生姓名：")
  
  chinese = input("请重新输入语文成绩：")
  while not chinese.isdigit() or int(chinese) > 100 or int(chinese) < 0:
   chinese = input("输入错误，请重新输入：")
  
  math = input("请重新输入数学成绩：")
  while not math.isdigit() or int(math) > 100 or int(math) < 0:
   math = input("输入错误，请重新输入：")
  
  english = input("请重新输入英语成绩：")
  while not english.isdigit() or int(english) > 100 or int(english) < 0:
   english = input("输入错误，请重新输入：")
  
  total = int(chinese) + int(math) + int(english)
  db = pymysql.connect(host="127.0.0.1", user="root", passwd="hisense", db="test", port=3306, charset="utf8")
  cursor = db.cursor()
  sql1="update stusys set name ='%s' where id = %s"%(name,modifyid)
  cursor.execute(sql1)
  sql2="update stusys set math = %s where id = %s"%(math,modifyid)
  cursor.execute(sql2)
  sql3 = "update stusys set english = %s where id =%s"%(english,modifyid)
  cursor.execute(sql3)
  sql4 = "update stusys set total = %s where id = %s"%(total,modifyid)
  cursor.execute(sql4)
  sql5 = "update stusys set chinese = %s where id = %s"%(chinese,modifyid)
  cursor.execute(sql5)
  db.commit()
  db.close()
  
def allinfo():
 db=pymysql.connect(host="127.0.0.1",user="root",passwd="hisense",db="test",port=3306,charset="utf8")
 cursor=db.cursor()
 sql="select * from stusys"
 cursor.execute(sql)
 results= cursor.fetchall()
 for row in results:
  ID = row[0]
  NAME = row[1]
  CHINESE = row[2]
  ENGLISH = row[3]
  MATH = row[4]
  TOTAL = row[5]
  # 打印结果
  print("ID=%d,NAME=%s,CHINESE=%d,ENGLISH=%d,MATH=%d,TOTAL=%d" % \
    (ID, NAME, CHINESE, ENGLISH, MATH,TOTAL))
  
def studentMenu():
 print("="*30)
 print("学生管理系统")
 print("1、添加学生信息")
 print("2、删除学生信息")
 print("3、查询学生信息")
 print("4、修改学生信息")
 print("5、全部学生信息")
 print("6、退出")
 print("="*30)
  
  
  
if __name__ == '__main__':
  
 while True:
  studentMenu()
  menuindex = input("请输入选项序号：")
  while not menuindex.isdigit():
   menuindex = input("输入错误，请重新输入：")
  if int(menuindex) ==1:
   appendStudentInfo()
  elif int(menuindex) ==2:
   delstudent()
  elif int(menuindex) ==3:
   querystudentid = idinput("请输入要查询的学生学号：")
   querystudent(querystudentid)
  elif int(menuindex) ==4:
    modifystudentifo()
  elif int(menuindex) == 5:
    allinfo()
  elif int(menuindex) == 6:
   break
  else:
   print("输入序号无效")

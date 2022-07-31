# -*- coding: utf-8 -*-
"""
Created on Wed Oct 23 16:12:30 2019

@author: LJZ
"""

import  tkinter
import tkinter.messagebox
from PIL import ImageTk,Image
#import pymysql
import pymssql
#import sys
#import importlib
#import imp
#imp.reload(sys)
#importlib.reload(sys)
#import codecs
#sys.stdout=codecs.getwriter("utf-8")(sys.stdout.detach())


root=tkinter.Tk()
root.title("机票管理")
#大小
width=700
height=500
root.minsize(width,height)
#root.maxsize(width,height)

#背景
image2=Image.open('plane.png')
background_image=ImageTk.PhotoImage(image2)
#width=background_image.width()
#height=background_image.height()
#位置
#screen_width=root.winfo_screenwidth()
#screen_height=root.winfo_screenheight()
#x=(screen_width-width)/2
#y=(screen_height-height)/2
background_label=tkinter.Label(root,image=background_image)
background_label.place(x=0,y=0,relwidth=1,relheight=1)
##
#canvas=tkinter.Canvas(root)#创建画布
#image_file=tkinter.PhotoImage(file='plane.png')
#image=canvas.create_image(0,0,anchor='nw',image=image_file)
#canvas.pack(fill="both",expand="yes")

#位置
screen_width=root.winfo_screenwidth()
screen_height=root.winfo_screenheight()
x=(screen_width-width)/2
y=(screen_height-height)/2
root.geometry('%dx%d+%d+%d'%(width,height,x,y))
#用户信息
userlabel=tkinter.Label(root,text="用户名：",font=('黑体',20),bg='white')
userlabel.place(x=150,y=150)
passlabel=tkinter.Label(root,text="密码：",font=('黑体',20),bg='white')
passlabel.place(x=180,y=200)

var_username=tkinter.StringVar()#定义变量
var_password=tkinter.StringVar()#定义变量

enter_username=tkinter.Entry(root,textvariable=var_username,bd=5)#用户名框
enter_username.place(x=270,y=155)
enter_password=tkinter.Entry(root,textvariable=var_password,bd=5,show='*')#密码框
enter_password.place(x=270,y=205)
#事件
def userlogin():
    #读取信息
    username=var_username.get()
    password=var_password.get()
    #异常捕获
    try:
        with open('user.pickle','rb') as user_file:
            user_info=pickle.load(user_file)
    except FileNotFoundError:
        #print('找不到文件')
        tkinter.messagebox.showinfo(title='error',message='FileNotFoundError')

        
def usersignin():
    window_sign_in=tkinter.Toplevel(root)
    #window_sign_in.attributes("-toolwindow",1)
    window_sign_in.wm_attributes("-topmost",1)#界面在上方
    window_sign_in.title('注册界面')
    #window_sign_in.minsize(300,200)
    #window_sign_in.maxsize(width,height)
    window_sign_in.geometry('%dx%d+%d+%d'%(600,500,500,200))
    #window_sign_in.geometry('400x400')

    new_userlabel=tkinter.Label(window_sign_in,text="用户名：",font=('黑体',15))
    new_userlabel.place(x=90,y=90)
    new_userid=tkinter.Label(window_sign_in,text="身份证号：",font=('黑体',15))
    new_userid.place(x=70,y=120)
    new_passlabel=tkinter.Label(window_sign_in,text="新密码：",font=('黑体',15))
    new_passlabel.place(x=90,y=150)
    new_passlabel2=tkinter.Label(window_sign_in,text="确认密码：",font=('黑体',15))
    new_passlabel2.place(x=70,y=180)
    
    new_username=tkinter.StringVar()#定义用户名
    new_userid=tkinter.StringVar()#定义用户身份证号
    new_password=tkinter.StringVar()#定义密码
    new_password2=tkinter.StringVar()#确定密码

    enter_new_username=tkinter.Entry(window_sign_in,textvariable=new_username,bd=5)#用户名框
    enter_new_username.place(x=170,y=90)
    enter_new_userid=tkinter.Entry(window_sign_in,textvariable=new_userid,bd=5)#用户id框
    enter_new_userid.place(x=170,y=120)
    enter_new_password=tkinter.Entry(window_sign_in,textvariable=new_password,bd=5,show='*')#密码框
    enter_new_password.place(x=170,y=150)
    enter_new_password2=tkinter.Entry(window_sign_in,textvariable=new_password2,bd=5,show='*')#密码框
    enter_new_password2.place(x=170,y=180)
    
    username=new_username.get()#用户名
    userid=new_userid.get()#用户身份证号
    password=new_password.get()#密码
    password2=new_password2.get()#确定密码

    

    def sign():
#        if password2 != password:
#            tkinter.messagebox.showinfo(title='error',message='error')
#            return
#            #print('error!')LAPTOP-NPQAC07P
        coon=pymssql.connect(host=".",user='admin',password='1111',database="机票管理", charset='utf8')
        cur=coon.cursor()
        sql="""select * from 密码表"""
        cur.execute(sql)
        return

    btn_sign_in=tkinter.Button(window_sign_in,text='确定注册',command=sign,font=('黑体',15))
    btn_sign_in.place(x=160,y=400)
    btn_sign_cancel=tkinter.Button(window_sign_in,text='取消',command=window_sign_in.withdraw,font=('黑体',15))
    btn_sign_cancel.place(x=300,y=400)


#按钮
btn_login=tkinter.Button(root,text='登录',command=userlogin,font=('黑体',15))
btn_signin=tkinter.Button(root,text='注册',command=usersignin,font=('黑体',15))
btn_login.place(x=220,y=300)
btn_signin.place(x=330,y=300)



root.mainloop()



















































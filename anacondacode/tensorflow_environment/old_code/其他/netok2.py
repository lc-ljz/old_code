# -*- coding: utf-8 -*-
"""
Created on Tue Dec 31 21:26:13 2019

@author: LJZ
"""

#import socket module
from socket import * # 导入python套接字编程的库
serverSocket = socket(AF_INET, SOCK_STREAM) # new一个TCP欢迎套接字
#Prepare a sever socket 
serverSocket.bind(('',2209)) # 将TCP欢迎套接字绑定到指定端口1234
serverSocket.listen(1) # 设置服务器最大连接客户机数目为1

# 主体程序：服务器和客户机进行信息的交互
while True:     
	#Establish the connection    
	print ('Ready to serve...')     
	connectionSocket, addr =  serverSocket.accept(); # 建立一个TCP连接套接字，等待与客户端联系
	try:         
		message = connectionSocket.recv(1024); # 当建立了联系(accept()后)，获取客户发送的报文
		filename = message.split()[1]                          
		f = open(filename[1:])
		outputdata = f.read(); # 从报文中读取信息
		#Send one HTTP header line into socket         
		header = ' HTTP/1.1 200 OK\nConnection: close\nConnent-Type: text/html\nConnent-Length: %d\n\n' % (len(outputdata))
		connectionSocket.send(header.encode())
						#Send the content of the requested file to the client(将 Web服务器请求到的网页 返还给客户机)
		for i in range(0, len(outputdata)):
			connectionSocket.send(outputdata[i].encode())
			
		connectionSocket.close()# 关闭TCP连接套接字
		
	except IOError:
		#Send response message for file not found(如果连接建立失败：请求的文件找不到，则返回错误信息)
		header = ' HTTP/1.1 404 Not Found'
		connectionSocket.send(header.encode())
         
		connectionSocket.close()# 关闭TCP连接套接字
		
serverSocket.close()# 关闭TCP欢迎套接字
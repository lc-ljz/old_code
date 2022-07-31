# -*- coding: utf-8 -*-
"""
Created on Tue Dec 31 21:20:27 2019

@author: LJZ
"""

import socket
import os
import sys
import struct
import time
import select
import binascii

ICMP_ECHO_REQUEST = 8
# 计算checksum
def checksum(str):
    csum = 0
    countTo = (len(str) / 2) * 2
    count = 0
    while count < countTo:
        thisVal = str[count+1] * 256 + str[count]
        csum = csum + thisVal
        csum = csum & 0xffffffff
        count = count + 2
        
    if countTo < len(str):
        csum = csum + str[len(str) - 1].decode()
        csum = csum & 0xffffffff

    csum = (csum >> 16) + (csum & 0xffff)
    csum = csum + (csum >> 16)
    answer = ~csum
    answer = answer & 0xffff
    answer = answer >> 8 | (answer << 8 & 0xff00)
    return answer

# 客户机接收服务器的Pong响应
def receiveOnePing(mySocket, ID, sequence, destAddr, timeout):
    timeLeft = timeout

    while 1:
        startedSelect = time.time()
        whatReady = select.select([mySocket], [], [], timeLeft)
        howLongInSelect = (time.time() - startedSelect)
        if whatReady[0] == []: # Timeout
            return "Request timed out."

        timeReceived = time.time()
        recPacket, addr = mySocket.recvfrom(1024)

        #Fetch the ICMP header from the IP packet
		#获得ICMP_ECHO_REPLY结构体，取出校验和checksum、序列号ID、生存时间TTL
		#获得ICMP_ECHO_REPLY结构体，取出校验和checksum、序列号ID、生存时间TTL
		
        header = recPacket[20: 28]
        type,code,checksum,packetID,sequence = struct.unpack("!bbHHh", header)
        if type == 0 and packetID == ID:
            byte_in_double = struct.calcsize("!d")
            timeSent = struct.unpack("!d", recPacket[28: 28 + byte_in_double])[0]
            delay = timeReceived - timeSent
            ttl = ord(struct.unpack("!c", recPacket[8:9])[0].decode())
            return (delay, ttl, byte_in_double)
        
        timeLeft = timeLeft - howLongInSelect
        if timeLeft <= 0:
        	return "Request timed out."

# 客户机向服务器发送一个Ping报文
def sendOnePing(mySocket, ID, sequence, destAddr):
    # Header is type (8), code (8), checksum (16), id (16), sequence (16)
    
    myChecksum = 0
    # Make a dummy header with a 0 checksum.
    # struct -- Interpret strings as packed binary data
    header = struct.pack("!bbHHh", ICMP_ECHO_REQUEST, 0, myChecksum, ID, sequence)
    data = struct.pack("!d", time.time())
    # Calculate the checksum on the data and the dummy header.
    myChecksum = checksum(header + data)

    # Get the right checksum, and put in the header
    #if sys.platform == 'darwin':
    #   myChecksum = socket.htons(myChecksum) & 0xffff
    #    Convert 16-bit integers from host to network byte order.
    #else:
    #    myChecksum = socket.htons(myChecksum)
    
    header = struct.pack("!bbHHh", ICMP_ECHO_REQUEST, 0, myChecksum, ID, sequence)
    packet = header + data
    
    # AF_INET address must be tuple, not str
    #Both LISTS and TUPLES consist of a number of objects
    #which can be referenced by their position number within the object
    mySocket.sendto(packet, (destAddr, 1)) 

# 客户机发出一次Ping请求
def doOnePing(destAddr, ID, sequence, timeout):
    icmp = socket.getprotobyname("icmp")

    #SOCK_RAW is a powerful socket type. For more details see: http://sock-raw.org/papers/sock_raw
    #SOCK_RAW：原始套接字
	#普通的套接字无法处理**ICMP**、IGMP等网络报文，而**SOCK_RAW**可以；

    #Create Socket here
	#创建一个套接字，使得客户机和服务器相关联
    mySocket = socket.socket(socket.AF_INET, socket.SOCK_RAW, icmp)
	
	# 向服务器发送一个Ping报文
    sendOnePing(mySocket, ID, sequence, destAddr)
	
	# 从服务器接收一个Pong报文
    delay = receiveOnePing(mySocket, ID, sequence, destAddr, timeout)

    mySocket.close()
    return delay

# 要调用的主体程序
def ping(host, timeout=1):
    # timeout=1 means: If one second goes by without a reply from the server,
    # the client assumes that either the client’s ping or the server’s pong is lost
    dest = socket.gethostbyname(host)
    print("Pinging " + dest + " using Python:")
    print("")
    # Send ping requests to a server separated by approximately one second
    
    myID = os.getpid() & 0xFFFF
    loss = 0
    for i in range(10): # 向服务器发出4次Ping请求
        result = doOnePing(dest, myID, i, timeout)
        if not result:
            print("第"+str(i)+"次Ping请求超时(>1s)")# 响应超时，丢包数量+1
            loss += 1
        else:
            delay = int(result[0]*1000)
            ttl = result[1]
            bytes = result[2]
            print("第"+str(i)+"次Ping请求成功：")
            print("收到的Pong响应消息："+dest+":byte(s)="+str(bytes)+"delay="+str(delay)+"ms TTL="+str(ttl))
        time.sleep(1)
    print("发送次数:"+str(10)+" 发送成功次数:"+str(10-loss)+" 丢包次数:"+str(loss))
	
    '''
        原始的请求代码(客户机发出无数次Ping请求，而且没有考虑请求成功与否)
        while 1 :
        delay = doOnePing(dest, timeout)
        print delay
        time.sleep(1)# one second
        return delay
    '''
    return
ping("www.baidu.com")
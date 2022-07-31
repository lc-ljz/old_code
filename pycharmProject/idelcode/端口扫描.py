"""
from socket import *
import threading

lock = threading.Lock()
openNum = 0
threads = []

def portScanner(host,port):
    global openNum
    try:
        s = socket(AF_INET,SOCK_STREAM)
        s.connect((host,port))
        lock.acquire()
        openNum+=1
        print('[+] %d open' % port)
        lock.release()
        s.close()
    except:
        pass

def main():
    setdefaulttimeout(1)
    ip = input('please enter your host: ')
    for p in range(1,4000):
        t = threading.Thread(target=portScanner,args=(ip,p))
        threads.append(t)
        t.start()     

    for t in threads:
        t.join()

    print('[+] The scan is complete!')
    print('[+] A total of %d open port ' % (openNum))

if __name__ == '__main__':
    main()

"""
"""
import platform
print(platform.platform())
"""


"""
import socket
import time
 
 
target_IP = "192.168.137."
IP_range = 10
IP_up = []
port_range = 1024
delay = 0.001
print('Max delay: %ss'%(delay))
print('Port range: 0~%s'%(port_range-1))
 
time_start = time.time()
for j in range(IP_range):
	print('Scan %s: '%(target_IP + str(j)))
	up=0
	for port in range(port_range):
		s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		s.settimeout(delay)
		result = s.connect_ex((target_IP + str(j), port))
		if result == 0:
			print('Port %d: open'%(port))
			up=1		
		s.close()
	if up!=0:
		IP_up.append(target_IP + str(j))
time_end=time.time()
print('PortScan done! %d IP addresses (%d hosts up) scanned in %f seconds.'%(IP_range, len(IP_up), time_end-time_start))
print('Up hosts:')
for i in IP_up:
	print(i)

"""



import socket
target_IP = "192.168.137.1"

#target_IP = socket.gethostbyname("www.baidu.com")

print('Scan %s: '%(target_IP))
print(socket.gethostbyaddr(target_IP))
for port in range(1024):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(0.001)
    result = s.connect_ex((target_IP , port))
    if result == 0:
        print('Port %d: open'%(port))
    s.close()






"""
import socket   #socket模块
#import commands   #执行系统命令模块
import subprocess
HOST=socket.gethostbyname("www.baidu.com")
PORT=50007
s= socket.socket(socket.AF_INET,socket.SOCK_STREAM)   #定义socket类型，网络通信，TCP
s.bind((HOST,PORT))   #套接字绑定的IP与端口
s.listen(1)         #开始TCP监听
while 1:
       conn,addr=s.accept()   #接受TCP连接，并返回新的套接字与IP地址
       print('Connected by',addr)    #输出客户端的IP地址
       while 1:
           data=conn.recv(1024)    #把接收的数据实例化commands.getstatusoutput(data)
           cmd_status,cmd_result=subprocess.getstatusoutput(data)
           if len(cmd_result.strip()) ==0:
               conn.sendall('Done.')
           else:
                conn.sendall(cmd_result)  
conn.close()
"""


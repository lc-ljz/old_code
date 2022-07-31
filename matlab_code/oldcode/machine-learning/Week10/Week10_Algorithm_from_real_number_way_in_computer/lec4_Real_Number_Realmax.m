% 运行这段脚本， 你会看到说明， IEEE 双精度形式的最大有限浮点数
% IEEE:Institute of Electrical and Electronics Engineers 你可以百度
% 双精度即64位二进制
% 现在问题来了， 这个数是怎么计算出来的呢？
help realmax;
realmax
% 64位二进制数，第一位是符号位， 那这样
% 01111111,.....,11111111111
% homework 
% 1. y = 上面的二进制表示的实数，并且验证 R == realmax返回1
% 注意e(y) 的形式, 图 实数2.png中
% 2. realmax + 99342923242232322 放到命令行里看返回什么
% 3. realmax + 99342923242232322 == realmax看返回什么
% 4. realmax + num 什么时候不返回realmax的值， num最小取多少? 

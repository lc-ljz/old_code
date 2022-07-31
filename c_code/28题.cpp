//[28]从键盘输入18位身份证号，编程校验该身份证号码有有效性，校验算法如下： 
//将身份证号码前17位数分别乘以不同的系数。从第1位到第17位的系数分别为：7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2，将所有乘积相加，将结果对11取余，
//余数0到10分别对应1,0,X,9,8,7,6,5,4,3,2，对应的数字或字母’X’就是身份证号最后一位，如果计算结果与最后一位不相符，该身份证号验证有错。 

#include<stdio.h>

int dec(char[]);

int main() 
{
	char a[18],i;
	printf("输入身份证号：");
	for(i=0;i<18;i++)
	   scanf("%c",&a[i]);
	if(dec(a)==1)
	   printf("判断结果：正确\n");
	else printf("判断结果：错误\n");
	return 0;
}
int dec(char a[18])
{
	int i,j,c[18],d=0,e,b[17]={7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2};
	for(i=0;i<17;i++)
	   c[i]=(a[i]-'0')*b[i];
	for(i=0;i<17;i++)
	   d=c[i]+d;
	e=d%11;
	if(e==0)
	{
		if(a[17]=='1') return 1;
		else         return 0;
	}
	else if(e==1)
	{
		if(a[17]=='0') return 1;
		else         return 0;
	}
	else if(e==2)
	{
		if(a[17]=='x') return 1;
		else           return 0;
	}
    else
    {
    	for(i=3;i<=10;i++)
    	{
    		if((a[17]-'0')==12-i) return 1;
    		else   continue;
		}
	}
	return 0;
}

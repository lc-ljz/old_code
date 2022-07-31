#include<stdio.h>

int main()
{
	int i,a,b,x,y;
	printf("输入两个整数：");
	scanf("%d%d",&a,&b);
	x=a;
	if(a>b)  x=b;
	for(i=x;i>=2;i--)
	{
		if(a%i==0&&b%i==0)
		{
			printf("最大公约数为：%d\n",i);
			return 0;
		}
	}
	printf("无最大公约数。\n");
	return 0; 
}

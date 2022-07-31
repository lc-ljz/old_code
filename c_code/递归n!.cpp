#include<stdio.h>

int fac(int);
int main()
{
	int a,b;
	printf("输入一个正整数：");
	scanf("%d",&a);
	if(a==1) 
	   printf("%d!=%d\n",1,1); 
	else
	{
		
		b=fac(a);
		
		printf("%d!=%d",a,b);
	}
	return 0;
}
int fac(int a)
{
	if(a<2) return a;
	else
	{
		a=a*fac(a-1);
	}
}

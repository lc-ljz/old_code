#include<stdio.h>
 
int max(int,int);
int min(int,int);
int (*p)(int,int);

int main()
{
	int a,b,c,d;
	printf("输入两个整数，空格分开：");
	scanf("%d%d",&a,&b);printf("\n");
	printf("1:最大值\n");
	printf("2:最小值\n");
	printf("输入选项：");scanf("%d",&c);
	if(c==1)
	{
	    p=max;
		d=(*p)(a,b);
		printf("max=%d\n",d);
	}  
	else
	{
		p=min;
		d=(*p)(a,b);
		printf("min=%d\n",d);
	}       
	return 0;
} 
int max(int x,int y)
{
	if(x>y) return x;
	else return y;
}
int min(int x,int y)
{
	if(x<y) return x;
	else return y;
}

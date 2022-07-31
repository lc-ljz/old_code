#include<stdio.h>

int main()
{
	int a,b,c,d;
	printf("请输入两个整数，用逗号隔开：");
	scanf("%d,%d",&a,&b);printf("\n");
	printf("1:两数相加\n");
	printf("2:两数相减\n");
	printf("3:两数相乘\n");
	printf("输入选项：");scanf("%d",&c);
	switch(c)
	{
		case 1:d=a+b;break;
		case 2:d=a-b;break;
		default:d=a*b;break;
	}
	printf("%d",d);
	return 0;
}

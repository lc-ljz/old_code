#include<stdio.h>

int main()
{
	int a,b,c,d;
	printf("�����������������ö��Ÿ�����");
	scanf("%d,%d",&a,&b);printf("\n");
	printf("1:�������\n");
	printf("2:�������\n");
	printf("3:�������\n");
	printf("����ѡ�");scanf("%d",&c);
	switch(c)
	{
		case 1:d=a+b;break;
		case 2:d=a-b;break;
		default:d=a*b;break;
	}
	printf("%d",d);
	return 0;
}

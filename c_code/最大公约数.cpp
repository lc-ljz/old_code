#include<stdio.h>

int main()
{
	int i,a,b,x,y;
	printf("��������������");
	scanf("%d%d",&a,&b);
	x=a;
	if(a>b)  x=b;
	for(i=x;i>=2;i--)
	{
		if(a%i==0&&b%i==0)
		{
			printf("���Լ��Ϊ��%d\n",i);
			return 0;
		}
	}
	printf("�����Լ����\n");
	return 0; 
}

#include<stdio.h>
#include<math.h>
int main()
{
	int a,b,c;
	printf("����һ��������\n");
	scanf("%d",&a);printf("\n");
	if(a==0) printf("0\n");
	else
	{
		while(a!=0)
		{
			b=a%10;a=a/10;
			printf("%d",b);
		}
	}
	return 0;
}

#include<stdio.h>
#include<math.h>
int main()
{
	int a,b,c,n,d=0;
	for(n=101;n<1000;n++)
	{
		c=n%10;b=(n/10)%10;
		a=n/100;
		if(a+b+c==5)
		{
			printf("%d ",n);
			d=d+1;
	    }
	}
	printf("\n");
	printf("100��200����%d������λ���ֺ�Ϊ5.\n",d);
	return 0;
}

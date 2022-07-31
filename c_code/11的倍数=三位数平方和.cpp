#include<stdio.h>
#include<math.h>
int main()
{
	int a,b,c,n,d;
	for(n=100;n<1000;n++)
	{
		c=n%10;b=(n/10)%10;a=n/100;
		if(a!=b&&a!=c&&b!=c) continue;
		else
		{
			if(a*a+b*b+c*c==n/11) printf("%d\n",n);
			else                  continue;
		}
	}
	return 0;
}

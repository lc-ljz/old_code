/////////////////////////////////////////////
///fibonaccl��              ///////////////////
///�����170205 ������    ///////////////////
/////////////////////////////////////////////
#include<stdio.h>

int main()
{
	int a[21],i,b=1;
	a[0]=0;a[1]=1;printf("%d ",a[1]);
	for(i=2;i<=20;i++)
	{
		a[i]=a[i-1]+a[i-2];
		b=b+1;
		printf("%d ",a[i]);
	}
	return 0;
 } 

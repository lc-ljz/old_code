//////////////////////////////////////////
/////100~200的素数        ////////////////
////计算机170205 刘九洲   ///////////////
////////////////////////////////////////// 
#include<stdio.h>
int main()
{
	printf("100~200所有素数：\n"); 
	int i,n,m,a=0;
	for(i=101;i<=200;i=i+2)
	{
		for(n=2;n<i;n++)
		{
			m=i%n;
			a=a+1;
			if(m==0) break;
			else continue;
		}
		if(a>i)
		{
			printf("%d ",i);
		}
	}
	return 0;
}

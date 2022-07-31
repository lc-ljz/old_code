///////////////////////////////////////////
///选择排序法.cpp 
///计算机1702刘九洲  2017-12-8-18时 
//////////////////////////////////////////


/*
#include<stdio.h>

int main()
{
	int i,j,k,t,a[10]={1,52,69,74,-11,-61,8,21,5,13};
	for(i=0;i<9;i++)
	{
		k=i;
		for(j=i+1;j<10;j++)
		{
			if(a[j]>a[k])
			    k=j;
		}
		if(k!=i)
		{
			t=a[i];
			a[i]=a[k];
			a[k]=t;
		}
	}
	for(i=0;i<10;i++)
	{
		printf("%d\t",a[i]); 
	} 
	    
	return 0;
}
*/


#include<stdio.h>

int main()
{
	int i,j,k,t,n,a[81];
	printf("输入整数的个数:");
	scanf("%d",&n);
	printf("输入%d个整数：",n);
	for(i=0;i<n;i++)
	    scanf("%d",&a[i]);
	for(i=0;i<n-1;i++)
	{
		k=i;
		for(j=i+1;j<n;j++)
		{
			if(a[j]>a[k])
			    k=j;
		}
		if(k!=i)
		{
			t=a[i];
			a[i]=a[k];
			a[k]=t;
		}
		printf("排序后：");
		for(i=0;i<n;i++)
		    printf("%d ",a[i]);
	}
	return 0;
}



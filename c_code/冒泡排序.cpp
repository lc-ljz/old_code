////////////////////////////////////////////////
////冒泡排序法.cpp 
////计算机170205 刘九洲 
////////////////////////////////////////////////


/*
#include<stdio.h>

int main()
{
	int i,j,t,a[8]={14,25,3,91,-10,20,-3,0};
	for(i=0;i<8;i++)
	{
		for(j=0;j<7-i;j++)
		{
			if(a[j]>a[j+1])
			{
				t=a[j];
				a[j]=a[j+1];
				a[j+1]=t;
			}
		}
	}
	for(i=0;i<8;i++)
	    printf("%d ",a[i]);
	return 0;
}
*/

#include<stdio.h>
#include<stdlib.h>

int main()
{
	int i,j,t,*a=NULL,n;
	printf("请输入要比较的整数的个数：");
	scanf("%d",&n);
	a=(int *)malloc(n*sizeof(int));
	printf("输入整数：");
	for(i=0;i<n;i++)
	    scanf("%d",a+i);
	for(i=0;i<n;i++)
	{
		for(j=0;j<n-1-i;j++)
		{
			if(*(a+j)>*(a+1+j))
			{
				t=*(a+j);*(a+j)=*(a+j+1);*(a+j+1)=t;
			}
		}
	}
	printf("排序后的结果为：");
	for(i=0;i<n;i++)
	   printf("%d ",*(a+i));
	printf("\n");
	return 0;
	
}

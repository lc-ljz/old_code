////////////////////////////////////////////////
////ð������.cpp 
////�����170205 ������ 
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
	printf("������Ҫ�Ƚϵ������ĸ�����");
	scanf("%d",&n);
	a=(int *)malloc(n*sizeof(int));
	printf("����������");
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
	printf("�����Ľ��Ϊ��");
	for(i=0;i<n;i++)
	   printf("%d ",*(a+i));
	printf("\n");
	return 0;
	
}

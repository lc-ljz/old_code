///////////////////////////////////////////
///pointer.cpp
///�����170205������
//////////////////////////////////////////


/* 
#include<stdio.h>
#include<stdlib.h>

void bubblesort(int a[],int n);

int main()
{
	int i,*p=NULL,n;
	printf("��������������:");
	scanf("%d",&n);
	p=(int *)malloc(n*sizeof(int));
	if(p==NULL)
	{
        printf("�����ڴ�ʧ��\n");
		return 0;
	}
		
	printf("������%d������:",n);
	for(i=0;i<n;i++)
		scanf("%d",p+i);
		
	bubblesort(p,n);
	
	printf("��������Ϊ��");
    for(i=0;i<n;i++)
		printf("%d ",*(p+i));
	printf("\n");
    free(p);
    return 0;
}
void bubblesort(int a[],int n)
{
	int j,k,temp;
	for(j=0;j<n;j++)
	{
		for(k=0;k<n-j-1;k++)
		{
			if(a[k]<a[k+1])
			{
				temp=a[k];
				a[k]=a[k+1];
				a[k+1]=temp;
			}
		}
	}
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















